<?php
require_once 'system/core/Model.php';
require_once 'Object/Admin/ProductBaseInfo.php';
require_once 'Object/Admin/ShipInfo.php';
require_once 'Object/Admin/CustomerBaseInfo.php';
require_once 'application/models/UI/ProductOrderedModel.php';
//
class PaymentModel extends CI_Model{
	public $orderData;
	public $shipData;
	public function __construct() {
		parent::__construct();
	}
	//
	public function CompletePayment($shipData) {
		$this->shipData = $shipData;
		$shipId = $this->AddShipInfo();
		$orderId = $this->AddOrder($shipId);
		$this->AddAllOrderDetail($orderId);
		$this->DeleteSessionData();
		return $this->SendConfirmMail();
	}
	//
	public function DeleteSessionData() {
		$this->load->helper('url');
        $this->load->library('session');
        $this->session->unset_userdata('shoppingCart');
        return 0;
	}
	//
	public function SendConfirmMail() {
		$baseUrl = 'http://takavpp.com/';
		$proList = $this->orderData->productsList;
		$totalProduct = $this->GetTotalProduct($proList);
		$originalTotalMoney = $this->GetOriginalTotalMoney($proList);
		$promotionValue = $this->GetPromotionValue($proList);
		$paymentTotal = $originalTotalMoney - $promotionValue;
		$mailContent = '<table>
	    <tr>
	        <th colspan = "3" style="margin:10%;border-bottom: 1px solid #ddd;color:black;font-size:120%;">Bạn đã đặt mua</th>
	    </tr>
	    <tr>
	    	<th colspan = "3" style="margin:10%;border-bottom: 1px solid #ddd;color:black;font-size:110%;">
	        	<p>Đơn hàng ('.(string)$totalProduct.' sản phẩm)</p>
	        </th>
	    </tr>';
	    for ($i = 0; $i < count($proList); $i ++) {
	        $pro = $proList[$i];
	        $mailContent = $mailContent.'<tr>
	                    <td style = "margin:10%;border-bottom: 1px solid #ddd;">
	                        <img src = "'.$baseUrl.$pro->ImagePath.'"height="100px" width="100px" />
	                    </td>
	                    <td style = "margin:10%;border-bottom: 1px solid #ddd;">
	                        <a href = "'.$baseUrl.'san-pham/'.$pro->Id.'" style="color:#0000e6;font-size:100%;">'.(string)$pro->Quantity.' x '.(string)$pro->Name.'</a>
	                    </td>
	                    <td style = "margin:10%;border-bottom: 1px solid #ddd;">
	                        <p style="color:#006600;font-size:120%;">Giá : '.(string)$pro->Price.' ₫</p>
	                    </td>
	        			</tr>';
	    }
	    $mailContent = $mailContent.'
	                    <tr>
	                        <td style = "margin:10%;border-bottom: 1px solid #ddd;">
	                            <p>Tổng gốc : </p>
	                        </td>
	                        <td colspan = "2" style = "margin:10%;border-bottom: 1px solid #ddd;">
	                            <p style="color:#006600;font-size:90%;">'.(string)$originalTotalMoney.' ₫</p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td style = "margin:10%;border-bottom: 1px solid #ddd;">
	                            <p>Tổng khuyến mại : </p>
	                        </td>
	                        <td colspan = "2" style = "margin:10%;border-bottom: 1px solid #ddd;">
	                            <p style="color:#006600;font-size:90%;">'.(string)$promotionValue.' ₫</p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td style = "margin:10%;border-bottom: 1px solid #ddd;">
	                            <p>Thành tiền : </p>
	                        </td>
	                        <td colspan = "2" style = "margin:10%;border-bottom: 1px solid #ddd;">
	                            <p style="color:#e60000;font-size:125%;">'.(string)$paymentTotal.' ₫</p>
	                        </td>
	                    </tr>
					</table>';
		// for ($i = 0; $i < count($proList); $i ++) {
		// 	$pro = $proList[$i];
		// 	$mailContent = $mailContent.'<br/><p>'.(string)($pro->Quantity).' x '.(string)($pro->Name).'</p>';
		// }
		$this->load->database('default');
		$this->db->select('*');
		$this->db->where('Id', $this->shipData->Id);
		$query = $this->db->get('Customer');
		$result = $query->result('CustomerBaseInfo');
		$cus = $result[0];
		$cusMail = $cus->Email;
		$config = Array(
        'protocol' => 'smtp',
        'smtp_host' => 'ssl://smtp.gmail.com',
        'smtp_port' => 465,
        'smtp_user' => 'thekoy.95@gmail.com',    //email id
        'smtp_pass' => '0801Ks2N1301',            // password
        'mailtype'  => 'html', 
        'charset'   => 'utf-8'
	    );
	    $this->load->library('email', $config);
	    $this->email->set_newline("\r\n");
	    $this->email->from('thekoy.95@gmail.com','bepnhat.net');
	    $this->email->to($cusMail); // email array
	    $this->email->subject('Thông tin đơn hàng');   
	    $this->email->message($mailContent);
	    $result = $this->email->send();
	    $this->email->clear(TRUE);
	    return $result;
	}
	//
	public function AddAllOrderDetail($orderId) {
		$proList = $this->orderData->productsList;
		for ($i = 0; $i < count($proList); $i ++) {
			$this->AddAnOrderDetail($orderId ,$proList[$i]);
		}
	}
	//
	public function AddAnOrderDetail($orderId, $product) {
		$ordetailId = 0;
		$this->load->database('default');
		$this->db->select('max(cast(Id as decimal)) as MaxId');
		$query = $this->db->get('OrderDetail');
		$row = $query->row();
		if(isset($row))
		{
			$ordetailId = $row->MaxId + 1;
		}
		else{
			$ordetailId = 1;
		}
		$this->db->close();
		if ($product->IsPercentPromotion == "0") {
			$promotionValue = intval($product->PromotionValue);
		}
		else {
			$promotionValue = intval($product->Price) * intval($product->PromotionValue)/100;
		}
		$paymentPrice = intval($product->Price) - $promotionValue;
		$newOderDetail = array(
				'Id' => $ordetailId,
				'OrderId' => $orderId,
				'ProductId' => $product->Id,
				'OriginalPrice' => $product->Price,
				'PromotionValue' => $promotionValue,
				'PaymentPrice' => $paymentPrice,
				'Quantity' => $product->Quantity,
				'PromotionNote' => "ok"
			);
		$this->load->database('default');
		$this->db->insert('OrderDetail', $newOderDetail);
		$this->db->close();
		return 0;
	}
	//
	public function AddOrder($shipId) {
		$this->load->library('session');
        $cartSessionData = $this->session->get_userData('shoppingCart')['shoppingCart'];
        $this->orderData = json_decode($cartSessionData);
        //var_dump($this->orderData->productsList);
        $orderId = 0;
		$this->load->database('default');
		$this->db->select('max(cast(Id as decimal)) as MaxId');
		$query = $this->db->get('Order');
		$row = $query->row();
		if(isset($row))
		{
			$orderId = $row->MaxId + 1;
		}
		else{
			$orderId = 1;
		}
		$this->db->close();
		$cusId = $this->orderData->customerId;
		$shipInfoId = $shipId;
		$totalProduct = $this->GetTotalProduct($this->orderData->productsList);
		$originalTotalMoney = $this->GetOriginalTotalMoney($this->orderData->productsList);
		$promotionValue = $this->GetPromotionValue($this->orderData->productsList);
		$paymentTotal = $originalTotalMoney - $promotionValue;
		// $this->load->helper('date');
		// $orderDate = NOW();
		$newOrder = array(
			'Id' => $orderId,
			'CustomerId' => $cusId,
			'CustomerShipInfoId' => $shipId,
			'TotalProduct' => $totalProduct,
			'OrderNote' => $this->shipData->Note,
			'OriginalTotalMoney' => $originalTotalMoney,
			'PromotionValue' => $promotionValue,
			'PaymentTotal' => $paymentTotal,
			'TransportType' => '1',
			'PaymentType' => '1',
		);
		$this->load->database('default');
		$this->db->set('OrderDate', 'NOW()', FALSE);
		$this->db->set('ShipDate', 'NOW()', FALSE);
		$this->db->set('CreateDate', 'NOW()', FALSE);
		$this->db->insert('Order', $newOrder);
		$this->db->close();
		return $orderId;
	}
	//
	public function GetPromotionValue($proList) {
		$totalMoney = 0;
			for ($i = 0; $i < count($proList); $i ++) {
				$product = $proList[$i];
				if ($product->IsPercentPromotion == "0") {
					$totalMoney += intval($product->Quantity) * intval($product->PromotionValue);
				}
				else {
					$totalMoney += intval($product->Quantity) * intval($product->Price) * intval($product->PromotionValue)/100;
				}
			}
			return $totalMoney;
	}
	//
	public function GetOriginalTotalMoney($proList) {
		$totalMoney = 0;
		for ($i = 0; $i < count($proList); $i ++) {
			$product = $proList[$i];
			$totalMoney += intval($product->Quantity) * intval($product->Price);
		}
		return $totalMoney;
	}
	//
	public function GetTotalProduct($proList) {
		$total = 0;
		for ($i = 0; $i < count($proList); $i ++) {
			$total += intval($proList[$i]->Quantity);
		}
		return $total;
	} 
	//
	public function IsEntireCustomer($cusId) {
		$this->load->database('default');
		$this->db->select('*');
		$this->db->where('Id', $cusId);
		$query = $this->db->get('Customer');
		$result = $query->result('CustomerBaseInfo');
		$cus = $result[0];
		$this->db->close();
		if ($cus->Phone == "") {
			return false;
		}
		else {
			return true;
		}
	}
	//
	public function AddCustomerInfo() {
		$cusData = $this->shipData;
		$this->load->database('default');
		$data = array(
	        'Phone' => $cusData->Phone,
	        'ProvinceId' => $cusData->ProvinceId,
	        'DistrictId' => $cusData->DistrictId,
	        'Address' => $cusData->Address
		);
		$this->db->set($data);
		$this->db->where('Id', $cusData->Id);
		$this->db->update('Customer');
		$result = $this->db->affected_rows();
		$this->db->close();
		return $result;
	}
	//
	public function AddShipInfo() {
		$customerId = $this->shipData->Id;
		if (!($this->IsEntireCustomer($customerId))) {
			$this->AddCustomerInfo();
		}
		$shipId = 0;
		$this->load->database('default');
		$this->db->select('max(cast(Id as decimal)) as MaxId');
		$query = $this->db->get('ShipInfo');
		$row = $query->row();
		if(isset($row))
		{
			$shipId = $row->MaxId + 1;
		}
		else{
			$shipId = 1;
		}
		$this->db->close();
		$newShip = array(
				'Id' => $shipId,
				'Name' => $this->shipData->Name,
				'CustomerId' => $this->shipData->Id,
				'Phone' => $this->shipData->Phone,
				'Address' => $this->shipData->Address,
				'ProvinceId' => $this->shipData->ProvinceId,
				'DistrictId' => $this->shipData->DistrictId,
				'Note' => $this->shipData->Note
		);
		$this->load->database('default');
		$this->db->insert('ShipInfo', $newShip);
		$this->db->close();
		return $shipId;
	}
}
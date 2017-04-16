<?php
require_once 'application/models/UI/ShoppingCartModel.php';
require_once 'application/models/DataAccess/ProductDa.php';
require_once 'application/models/DataAccess/ImageDa.php';
require_once 'application/models/Admin/CustomerModel.php';
require_once 'application/models/Admin/ProvincesListModel.php';
require_once 'Object/Admin/CustomerBaseInfo.php';
require_once 'application/models/UI/PaymentModel.php';
//
defined('BASEPATH') OR exit('No direct script access allowed');
class Payment extends  CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
    }
    //
    public function Index() {
        $this->load->library('session');
        if ($this->session->has_userData('customer')) {
            $temp['title']="Thông tin giao hàng";
            $temp['content_view']='Front/Customer/Payment/StepTwo';
            $this->load->library('session');
            $data = $this->session->get_userData('customer');
            $cusId = $data['customer']['Id'];
            $cus = new CustomerModel();
            $curCus = $cus->GetInfo($cusId);
            $cusInfo = json_encode($curCus);
            $temp['data'] = $cusInfo;
        }
        else {
            $temp['title']="Đăng nhập thanh toán";
            $temp['content_view']='Front/Customer/Payment/StepOne';
            $temp['data'] = null;
        }
        $this->load->view("Front/Shared/_Layout",$temp);
    }
    //
    public function CompletePayment() {
        $shipInfo = $this->input->post('shipInfo', true);
        $shipData = json_decode($shipInfo);
        $payment = new PaymentModel();
        $result = $payment->CompletePayment($shipData);
        echo $result;
    }
}
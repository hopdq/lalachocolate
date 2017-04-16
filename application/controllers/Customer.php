<?php
require_once 'application/models/Admin/CustomerModel.php';
require_once 'application/models/Admin/ProvincesListModel.php';
require_once 'Object/Admin/CustomerBaseInfo.php';
//
defined('BASEPATH') OR exit('No direct script access allowed');
class Customer extends CI_Controller{
	public function __construct() {
		parent::__construct();
        $this->load->helper('url');
	}
    //
    public function CheckLoggedIn() {
        $this->load->library('session');
        if ($this->session->has_userData('customer')) {
            echo 1;
        }
        else {
            echo -1;
        }
    }
    //
	public function Login() {
        $temp['title']="Đăng nhập";
        $temp['content_view']='Front/Customer/Login';
        $temp['data'] = null;
        $this->load->view("Front/Shared/_Layout",$temp);
    }
    //
    public function LoginProcess() {
    	$this->load->helper('url');
    	$loginEmail = $this->input->post('loginEmail', true);
    	$loginPassword = md5($this->input->post('loginPassword', true));
    	$customer = new CustomerModel();
    	$customer->Init($loginEmail, $loginPassword);
    	$checkLogin = $customer->CheckLogin();
    	if ($checkLogin) {
    		$this->load->library('session');
    		$customerData = $customer->customer;
	    	$cusData = array(
				'Id' => $customerData[0]->Id,
				'Name' =>$customerData[0]->Name,
				'Status' => '1' 
			);
			$this->session->set_userdata('customer',$cusData);
            $this->load->library('session');
            if ($this->session->has_userdata('shoppingCart')) {
                $cartSessionData = json_decode($this->session->get_userData('shoppingCart')['shoppingCart']);
                if ($cartSessionData->customerId == "0") {
                    $cartSessionData->customerId = $customerData[0]->Id;
                    $this->session->set_userdata('shoppingCart', json_encode($cartSessionData));
                }
                else {
                    if ($cartSessionData->customerId != $customerData[0]->Id) {
                        $this->session->unset_userdata('shoppingCart');
                    }
                }
            }
            echo 1;
    	}
    	else {
    		echo '-1';
    	}
    }
    //
    public function Logout() {
    	$this->load->helper('url');
    	$this->load->library('session');
    	$this->session->unset_userdata('customer');
        $this->session->unset_userdata('shoppingCart');
        $this->SaveShoppingCartSession();
    	redirect('http://localhost/bepnhat/index.php');
    }
    //
    public function SaveShoppingCartSession() {
        return true;
    }
    //
    public function TestSession() {
    	$this->load->library('session');
    	var_dump($this->session->get_userData('customer'));
    }
    //
    public function GetAllProvinces() {
        $provincesList = new ProvincesListModel();
        $provincesList->Init();
        echo json_encode($provincesList);
    }
    //
    public function CheckingEmail() {
        $email = $this->input->post('checkedEmail', true);
        $this->load->database('default');
        $this->db->select('Email');
        $this->db->where('Email', $email);
        $query = $this->db->get('Customer');
        $result = $query->result('CustomerBaseInfo');
        if (count($result) == 0) {
            echo 1;
        }
        else {
            echo -1;
        }
    }
    //
    public function SignUpProcess() {
        $cusInfo = $this->input->post('customerInfo');
        $tmpCus = json_decode($cusInfo);
        $newCustomer = new CustomerModel();
        $cusId = $newCustomer->SignUp($tmpCus);
        echo $cusId;
    }
    //
    public function GetCurrentCustomerInfo() {
        $this->load->library('session');
        $data = $this->session->get_userData('customer');
        $cusId = $data['customer']['Id'];
        $cus = new CustomerModel();
        $curCus = $cus->GetInfo($cusId);
        $cusInfo = json_encode($curCus);
        echo $cusInfo;
    }
    //
    public function ShowProfile() {
        $temp['title']="Trang cá nhân";
        $temp['content_view']='Front/Customer/Profile';
        $temp['data'] = null;
        $this->load->view("Front/Shared/_Layout",$temp);
    }
}
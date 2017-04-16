<?php
require_once 'system/core/Model.php';
require_once 'Object/Admin/CustomerBaseInfo.php';

class CustomerModel extends CI_Model{
	//
	public $customer;
	//
	public function __construct() {
		parent::__construct();
		$this->customer = new CustomerBaseInfo();
	}
	//
	public function Init($email, $password) {
		$this->customer->Email = $email;
		$this->customer->Password = $password;
	}
	//
	public function CheckLogin() {
		$this->load->database('default');
		$this->db->select('*');
		$query = $this->db->where('Email', $this->customer->Email)->get('Customer');
		$cusData = $query->result('CustomerBaseInfo');
		if (count($cusData) == 0) {
			return false;
		}
		//var_dump($cusData[0]->Password);
		// var_dump($this->customer->Password);
		if ($cusData[0]->Password == $this->customer->Password) {
			$this->customer = $cusData;
			return true;
		}
		else {
			return false;
		}
	}
	//
	public function SignUp($cusTmp) {
		$cusId = 0;
		$this->load->database('default');
		$this->db->select('max(cast(Id as decimal)) as MaxId');
		$query = $this->db->get('Customer');
		$row = $query->row();
		if(isset($row))
		{
			$cusId = $row->MaxId + 1;
		}
		else{
			$cusId = 1;
		}
		$this->db->close();
		$newCus = array(
				'Id' => $cusId,
				'Name' => $cusTmp->Name,
				'Email' => $cusTmp->Email,
				'Password' => md5($cusTmp->Password),
				'Phone' => $cusTmp->Phone,
				'Address' => $cusTmp->Address,
				'ProvinceId' => $cusTmp->ProvinceId,
				'DistrictId' => $cusTmp->DistrictId
		);
		$this->load->database('default');
		$this->db->set('CreateDate', 'NOW()', FALSE);
		$this->db->insert('Customer', $newCus);
		$this->db->close();
		return $cusId;
	}
	//
	public function GetInfo($id) {
		$this->load->database('default');
		$this->db->select('*');
		$query = $this->db->where('Id', $id)->get('Customer');
		$curCus = $query->result('CustomerBaseInfo')[0];
		$this->db->close();
		return $curCus;
	}
}
<?php
require_once 'system/core/Model.php';
require_once 'Object/Admin/ProductBaseInfo.php';
require_once 'Object/Admin/ShipInfo.php';
require_once 'Object/Admin/CustomerBaseInfo.php';
require_once 'application/models/UI/ProductOrderedModel.php';
//
class ShoppingCartModel extends CI_Model{
	public $productsList;
	public $customerId;
	public $shipInfo;
	//
	public function __construct() {
		$this->productsList = array();
		$shipInfo = new ShipInfo();
		$this->load->library('session');
		if ($this->session->has_userdata('customer')) {
			$this->customerId = $this->session->get_userData('customer')['customer']['Id'];
		}
		else {
			$this->customerId = '0';
		}
	}
	//
	public function init() {
		return null;
	}
}
<?php
require_once 'Object/Admin/ProductBaseInfo.php';
//
class ProductOrderedModel{
		public $product;
		public $quantity;
		//
		public function __construct() {
			$this->product = new ProductBaseInfo();
			$this->quantity = 0;
		}
}
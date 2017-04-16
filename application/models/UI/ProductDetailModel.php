<?php
require_once 'application/models/DataAccess/ProductDa.php';
require_once 'application/models/DataAccess/ImageDa.php';
require_once 'application/models/UI/ProductItemModel.php';
require_once 'application/models/DataAccess/AttributeValueDa.php';
class ProductDetailModel extends CI_Model{
	public $productId;
	public $categoryId;
	public $detail;
	public $imgs;
	public $relateProducts;
	public $attrs;
	public function __construct($productId, $categoryId, $providerId){
		parent::__construct();
		$this->relateProducts = array();
		$this->productId = $productId;
		$this->categoryId = $categoryId;
		$this->providerId = $providerId;
		$this->attrs = array();
	}
	public function init(){
		if(isset($this->productId)){
			$productDa = new ProductDa();
			$this->detail = $productDa->getProductDetail($this->productId);
			$imageDa = new ImageDa();
			$this->imgs = $imageDa->GetImgListByProduct($this->productId);
			$this->load->helper('url');
			foreach ($this->imgs as $img) {
				$img->Path = base_url($img->Path);
			}
			$relateProducts = $productDa->getRelateProduct($this->productId, $this->categoryId);
			foreach ($relateProducts as $product) {
				$productItem = new ProductItemModel();
				$productItem->init($product);
				array_push($this->relateProducts, $productItem);
			}
			$attributeValuesDa = new AttributeValueDa();
			$attrs = $attributeValuesDa->getListMappingProduct($this->productId);
			$stdAttrs = array();
			if(isset($attrs) && count($attrs) > 0){
				foreach($attrs as $attr){
					if(isset($stdAttrs[$attr->AttributeId])){
						$stdAttr = $stdAttrs[$attr->AttributeId];
						$stdAttr->Value += ";" + $attr->Value;
					}
					else{
						$stdAttrs[$attr->AttributeId] = $attr;
					}
				}
			}
			if(count($stdAttrs) > 0){
				foreach($stdAttrs as $attr){
					array_push($this->attrs, $attr);
				}
			}
		}
	}
}
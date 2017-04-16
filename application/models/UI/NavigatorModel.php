<?php
require_once 'application/models/DataAccess/CategoryDa.php';
require_once 'application/models/DataAccess/ProviderDa.php';
class NavigatorModel extends CI_Model{
	public $listCategories;
	public $categoryId;
	public function __construct(){
		parent::__construct();
		$this->listCategories = array();
		$this->load->helper('url');
	}
	public function init(){
		$categoryDa = new CategoryDa();
		$categories = $categoryDa->getCategories();
		if(isset($this->categoryId))
		{
			$cateActiveId = $categoryDa->getCategoryLv1Active($this->categoryId);
		}
		$childs = array();
		if(isset($categories) && count($categories) > 0){
			foreach ($categories as $cate) {
				$cate->CategoryUrl = base_url('/danh-muc/'.$cate->Id);
				if(!isset($cate->ParentId) || $cate->ParentId == "0"){
					if(isset($cateActiveId) && $cate->Id == $cateActiveId){
						$cate->active = true;
					}
					else{
						$cate->active = false;
					}
					array_push($this->listCategories, $cate);
				}
				else{
					array_push($childs, $cate);
				}
			}
			$providerDa = new ProviderDa();
			if(isset($this->listCategories) && count($this->listCategories) > 0){
				foreach ($this->listCategories as $parent) {
					$parent->groupChilds = array(0 => array());
					$cnt = 1;
					$maxPages = 2;
					$limit = 15;
					$page = 0;
					$parent->groupChilds[0]['listItems'] = array();
					$curChilds = array();
					foreach ($childs as $child) {
						if($child->ParentId == $parent->Id) {
							$child->isLv2 = true;
							array_push($curChilds, $child);
							foreach ($childs as $gchild) {
								if($gchild->ParentId == $child->Id){
									$gchild->isLv2 = false;
									array_push($curChilds, $gchild);
								}
							}
						}
					}
					$maxItems = count($curChilds);
					$realItemsPerPage = ceil($maxItems / $maxPages);
					$limit = max($realItemsPerPage, $limit);
					foreach ($curChilds as $child) {
						array_push($parent->groupChilds[$page]['listItems'], $child);
						if ($cnt < $limit) {
							$cnt++;
						} else {
							$cnt = 1;
							$page++;
							$parent->groupChilds[$page]['listItems'] = array();
						}
					}
					$parent->providers = array();
					$providers = $providerDa->getListProvidersByCateLv1($parent->Id);
					if(isset($providers) && count($providers) > 0){
						foreach($providers as $provider){
							$provider->Link = base_url('thuong-hieu/'.$provider->Id);
							array_push($parent->providers, $provider);
						}
					}
				}
			}
		}
	}
}
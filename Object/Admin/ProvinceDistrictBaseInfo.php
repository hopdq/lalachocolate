<?php
	class ProvinceDistrictBaseInfo {
		//
		public $Id;
		public $Name;
		public $ParentId;
		public $districtsList;
		//
		public function __construct() {
			//
			$this->districtsList = array();
		}
	}
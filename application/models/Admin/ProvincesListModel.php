<?php
require_once 'system/core/Model.php';
require_once 'Object/Admin/ProvinceDistrictBaseInfo.php';
class ProvincesListModel extends CI_Model {
	//
	public $provincesList;
	//
	public function __construct() {
		//
		$this->provincesList = array();
	}
	//
	public function Init() {
		$this->load->database('default');
		$this->db->select('Id, Name, ParentId');
		$query = $this->db->get('ProvinceDistrict');
		$result = $query->result('ProvinceDistrictBaseInfo');
		$len = count($result);
		$counter = 0;
		for ($idx = 0; $idx < $len; $idx ++) {
			if ($result[$idx]->ParentId == '0') {
				$this->provincesList[$counter] =  $result[$idx];
				$counter ++;
			}
		}
		//
		for ($jdx = 0; $jdx < $counter; $jdx ++) {
			$cntr = 0;
			for ($idx = 0; $idx < $len; $idx ++) {
				if ($result[$idx]->ParentId == $this->provincesList[$jdx]->Id) {
					$this->provincesList[$jdx]->districtsList[$cntr] = $result[$idx];
					$cntr ++;
				}
			}
		}
	}
	//
}
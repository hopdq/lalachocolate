<?php
require_once 'system/core/Model.php';
class ProviderDa extends CI_Model{
	public function __construct(){
		parent::__construct();
	}
	public function GetListProviderBaseInfo(){
		$this->load->database('default');
		$this->db->select('Id, Name');
		$query = $this->db->get('Provider');
		$result = $query->result();
		$this->db->close();
		return $result;
	}
	public function GetListProviders(){
		$this->load->database('default');
		$this->db->select('Id, Name, LogoUrl');
		$query = $this->db->get('Provider');
		$result = $query->result();
		$this->db->close();
		return $result;
	}
	public function getListProvidersByCateLv1($categoryId){
		$this->load->database('default');
		$this->db->select('pr.Id, pr.Name, pr.LogoUrl');
		$this->db->join('Category c', 'c.Id = p.CategoryId');
		$this->db->join('Category cp', 'c.ParentId = cp.Id', 'left');
		$this->db->join('Provider pr', 'p.ProviderId = pr.Id');
		$this->db->where('c.Id', $categoryId);
		$this->db->or_where('cp.Id', $categoryId);
		$this->db->or_where('cp.ParentId', $categoryId);
		$this->db->distinct();
		$query = $this->db->get('Product p');
		$result = $query->result();
		$this->db->close();
		return $result;
	}
}
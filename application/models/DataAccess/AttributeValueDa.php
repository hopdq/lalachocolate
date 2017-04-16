<?php 
require_once 'system/core/Model.php';
require_once 'application/helpers/StringHelper.php';
class AttributeValueDa extends CI_Model{
	public function getListByProductId($productId){
		if(!isset($productId) || $productId == "")
		{
			$productId = "0";
		}
		$this->load->database('default');
		$this->db->select('av.Id,
			av.AttributeId,
			av.Value,
			case when ifnull(pa.ProductId, "0") != "0" then true else false end as Checked ');
		$this->db->join('Attributes att', 'av.AttributeId = att.Id');
		$this->db->join('ProductAttrValue pa', 'av.Id = pa.AttributeValueId and pa.ProductId = '.$productId, 'left');
		$this->db->distinct();
		$query = $this->db->get('AttributeValue av');
 		$result = $query->result();
		$this->db->close();
		return $result;
	}
	public function getListMappingProduct($productId){
		if(isset($productId)){
			$this->load->database('default');
			$this->db->select('av.Id,
			av.AttributeId,
			att.Name,
			av.Value');
			$this->db->join('Attributes att', 'av.AttributeId = att.Id');
			$this->db->join('ProductAttrValue pa', 'av.Id = pa.AttributeValueId');
			$this->db->where('pa.ProductId', $productId);
			$query = $this->db->get('AttributeValue av');
			$result = $query->result();
			$this->db->close();
			return $result;
		}
	}
	public function getListAttributes(){
		$this->load->database('default');
		$this->db->select("Id,Name,Code");
		$query = $this->db->get("Attributes");
 		$result = $query->result();
		$this->db->close();
		return $result;
	}
	public function updateAttributeValues($productId, $listAttrValues){
		if(count($listAttrValues) > 0){
			$this->load->database('default');
			$this->db->where_not_in('AttributeValueId', $listAttrValues);
			$this->db->where('ProductId', $productId);
			$this->db->delete('ProductAttrValue');
			foreach($listAttrValues as $attrValueId){
				$data = array(
					'ProductId' => $productId,
					'AttributeValueId'  => $attrValueId
				);
				$this->db->select('count(*) as cnt');
				$this->db->where('ProductId', $productId);
				$this->db->where('AttributeValueId', $attrValueId);
				$checkQuery = $this->db->get('ProductAttrValue');
				$check = $checkQuery->row();
				if(isset($check) && isset($check->cnt) && $check->cnt > 0){
					continue;
				}
				$this->db->insert('ProductAttrValue', $data);
			}
			$this->db->close();
			return 1;
		}
		return 0;
	}
}
<?php 
require_once 'system/core/Model.php';
class UserLoginModel extends CI_Model{
	private $email;
	private $password;
	public function __construct(){
		session_start();
		$this->load->database('default');
	}
	public function init($inEmail, $inPassword){
		$this->email = $inEmail;
		$this->password = $inPassword;
	}
	public function CheckLogin(){
		$sql = "select Id, Name from User where lower(Email) = lower(?) and Password = ?;";
		$query = $this->db->query($sql, array($this->email, md5($this->password)));
		$result = $query->row();
		$this->db->close();
		return $result;
	}
	public function getUserInSession(){
		$result = null;
		if(isset($_SESSION['adminUserLogin'])){
			$result = $_SESSION['adminUserLogin'];
		}
		return $result;
	}
	public function checkUserIsLogined(){
		return isset($_SESSION['adminUserLogin']);
	}
	public function setAdminUserLoginSession($user){
		$_SESSION['adminUserLogin'] = $user;
	}
	public function clearUserLoginSession(){
		$_SESSION['adminUserLogin'] = null;
	}
}
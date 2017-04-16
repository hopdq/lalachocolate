<?php
require_once 'application/models/UI/ShoppingCartModel.php';
require_once 'application/models/DataAccess/ProductDa.php';
require_once 'application/models/DataAccess/ImageDa.php';
//
defined('BASEPATH') OR exit('No direct script access allowed');
class Order extends  CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->helper('url');
    }
    //
    public function ProductInCart($proList, $proId) {
        $counter = 0;
        for ($i= 0; $i < count($proList); $i++) {
            if ($proList[$i]->Id == $proId) {
                $counter ++;
            }
        }
        return $counter;
    }
    //
    public function AddToCart(){
        if (!($this->CheckShoppingCartSession())) {
            $cart = new ShoppingCartModel();
            $this->load->library('session');
            $this->session->set_userdata('shoppingCart', json_encode($cart));
        }
        $this->load->library('session');
        $cartSessionData = $this->session->get_userData('shoppingCart')['shoppingCart'];
        $shoppingCart = json_decode($cartSessionData);
        $proId = $this->input->get('productId', true);
        $product = new ProductDa();
        $productData = $product->GetProduct($proId);
        $img = new ImageDa();
        $imgData = $img->GetImgListByProduct($proId);
        $productData->{"ImagePath"} = $imgData[0]->Path;
        $numberInCart = $this->ProductInCart($shoppingCart->productsList, $proId);
        if ($numberInCart != 0) {
            for ($i = 0; $i < count($shoppingCart->productsList); $i ++) {
                if ($shoppingCart->productsList[$i]->Id == $proId) {
                    $shoppingCart->productsList[$i]->Quantity += 1;
                    if ($shoppingCart->productsList[$i]->Quantity >= 20) {
                        $shoppingCart->productsList[$i]->Quantity = 20;
                    }
                }
            }
        }
        else {
            $productData->{"Quantity"} = 1;
            array_unshift($shoppingCart->productsList, $productData);
        }
        $this->load->library('session');
        $this->session->set_userdata('shoppingCart', json_encode($shoppingCart));
        echo $productData->Name;
    }
    //
    public function CheckShoppingCartSession() {
        $this->load->library('session');
        if ($this->session->has_userdata('shoppingCart')) {
            return true;
        }
        else {
            return false;
        }
    }
    //
    public function RemoveProduct() {
        $proId = $this->input->post('productId', true);
        $this->load->library('session');
        $cartSessionData = $this->session->get_userData('shoppingCart')['shoppingCart'];
        $shoppingCart = json_decode($cartSessionData);
        for ($i = 0; $i < count($shoppingCart->productsList); $i ++) {
            if ($shoppingCart->productsList[$i]->Id == $proId) {
                array_splice($shoppingCart->productsList, $i, 1);
                break;
            }
        }
        $this->session->set_userdata('shoppingCart', json_encode($shoppingCart));
        echo 1;
    }
    //
    public function ChangeProductQuantity() {
        $proId = $this->input->post('productId', true);
        $proQuan = $this->input->post('productQuantity', true);
        $this->load->library('session');
        $cartSessionData = $this->session->get_userData('shoppingCart')['shoppingCart'];
        $shoppingCart = json_decode($cartSessionData);
        for ($i = 0; $i < count($shoppingCart->productsList); $i ++) {
            if ($shoppingCart->productsList[$i]->Id == $proId) {
                $shoppingCart->productsList[$i]->Quantity = $proQuan;
                break;
            }
        }
        $this->session->set_userdata('shoppingCart', json_encode($shoppingCart));
        echo 1;

    }
    //
    public function ShowCart() {
        $temp['title']="Giỏ hàng";
        $temp['content_view']='Front/Customer/Cart';
        $temp['data'] = null;
        $this->load->view("Front/Shared/_Layout",$temp);
    }
    //
    public function GetImageProduct() {
        $proId = $this->input->post('productId', true);
        $img = new ImageDa();
        $imgData = $img->GetImgListByProduct($proId);
        echo $imgData[0]->Path;
    }
    //
    public function GetCart() {
        $this->load->library('session');
        if ($this->session->has_userdata('shoppingCart')) {
            $cartSessionData = $this->session->get_userData('shoppingCart')['shoppingCart'];
            echo $cartSessionData;
        }
        else {
            echo "-1";
        }
    }
    //
    public function TestSession() {
        $this->load->library('session');
        var_dump($this->session->get_userData('shoppingCart'));
    }
    //
    public function CancelShoppingCart() {
        $this->load->helper('url');
        $this->load->library('session');
        $this->session->unset_userdata('shoppingCart');
        redirect('http://localhost/bepnhat/index.php');
    }
}
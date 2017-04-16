<style type="text/css">
	#cartField {
		border-top: 1px solid #ccccff;
	}
	*.moneyField {
		font-size: 95%;
		font-weight: bold;
		text-align: center;
		margin-top: 5%;
	}
</style>

<div ng-app = "shoppingCartApp">
	<div class = "container" ng-controller = "shoppingCartController">
		<div ng-if = 'productsList.length != 0'>
			<div><h3>GIỎ HÀNG CỦA TÔI</h3></div>
			<div class = "col-md-6 col-md-offset-8">
				<div class="col-md-4"><p>Tổng cộng :</p></div>
				<div style="color: red;font-weight: bold;font-size: 125%;" class="col-md-4"><p>{{totalMoney + ' ₫'}}</p></div>
			</div>
		</div>
		<div ng-if = 'productsList.length != 0'>
			<div class="col-md-4" style="font-size: 150%;">
				<div class="col-md-2 badge" style="background-color:#66ff66;font-size: 100%;">{{totalProduct}}</div>
				<div class="col-md-10"><p>Sản phẩm</p></div>
			</div>
			<div class="moneyField col-md-2">
				<h5>Giá</h5>
			</div>
			<div class="moneyField col-md-2">
				<h5>Số lượng</h5>
			</div>
			<div class="moneyField col-md-2">
				<h5>Khuyến mại</h5>
			</div>
			<div class="moneyField col-md-2">
				<h5>Thành tiền</h5>
			</div>
		</div>
		<div  ng-if = 'productsList.length == 0'>
			<div class="col-sm-2 col-md-1 col-md-offset-5" style="margin-top:5%;">
					<img ng-src="{{baseUrl + 'uploads/empty_shopping_cart.jpg'}}" width="100px" height="100px" alt="Không có sản phẩm nào trong giỏ hàng của bạn" />
			</div>
			<div  class="col-sm-2 col-md-10 col-md-offset-1" style="margin-top:5%;">
				<p class="alert alert-info" style="text-align:center;height:10%;">Không có sản phẩm nào trong giỏ hàng của bạn !</p>
			</div>
		</div>
		<div id = "cartField" class = "col-md-12" ng-repeat = "product in productsList">
			<div class = "productItem">
				<div class="col-sm-2 col-md-4 col-md-offset-0">
					<div class="col-md-10 col-md-offset-0">
						<div class="col-md-8 col-md-offset-0">
							<img ng-src="{{baseUrl + product.ImagePath}}" alt = "{{product.Name}}" height="100px" width="100px" />
						</div>
						<div ng-click = "removeProduct(product.Id);" class="col-md-4 col-md-offset-0" style="margin-top:30%;">
							<button type="button" class="btn btn-default btn-custom1 btn-item-delete">
		                        <img ng-src="{{baseUrl + 'uploads/trash_icon.png'}}" alt = "Xóa sản phẩm" height="14px" width="14px" />
	                    	</button>
	                    </div>
	                </div>
                    <div class="col-sm-10 col-sm-offset-0">
                    	<p>{{product.Name}}</p>
                    </div>
				</div>
				<div class="moneyField col-md-2 col-md-offset-0">
					<p>{{product.Price + ' ₫'}}</p>
				</div>
				<div class="moneyField col-md-2 col-md-offset-0">
					<select ng-change = "selectQuantity(product.Id);" ng-options = "option.Key for option in product.productQuantity.availableOptions track by option.Quantity" ng-model = "product.productQuantity.selectedOption" style="width:40%;font-weight:bold;">
f					
					</select>
				</div>
			</div>
			<div class="moneyField col-md-2 col-md-offset-0">
				<p ng-if = 'product.IsPercentPromotion == "0"'>{{product.Quantity * product.PromotionValue + ' ₫'}}</p>
				<p ng-if = 'product.IsPercentPromotion == "1"'>{{product.Quantity * (product.PromotionValue * product.Price/100) + ' ₫'}}</p>
			</div>
			<div class="moneyField col-md-2 col-md-offset-0">
				<p ng-if = 'product.IsPercentPromotion == "0"'>{{product.Quantity * (product.Price - product.PromotionValue) + ' ₫'}}</p>
				<p ng-if = 'product.IsPercentPromotion == "1"'>{{ product.Quantity * product.Price * (1 - product.PromotionValue/100) + ' ₫'}}</p>
			</div>
		</div>
		<div class="col-md-12"><hr/></div>
		<div class="col-md-12" ng-if = "productsList.length != 0">
			<div class="col-md-2 col-md-offset-2"><a class="btn btn-warning" style="font-size:125%;" href = "<?php echo base_url();?>"><i class="fa fa-arrow-left"></i>  Tiếp tục mua hàng</a></div>
			<div class="col-md-2 col-md-offset-4"><a class="btn btn-success" style="font-size:125%;" ng-click = "payment();">Thanh toán  <i class="fa fa-arrow-right"></i></a></div>
		</div>
		<div class="col-md-12" ng-if = "productsList.length == 0">
			<div class="col-md-4 col-md-offset-4"><a class="btn btn-warning" style="font-size:125%;" href = "<?php echo base_url();?>"><i class="fa fa-arrow-left"></i>  Trở lại mua hàng</a></div>
		</div>
		<input type = "hidden" id = "clickBinding" ng-click = "init();"/>
		<input type = "hidden" name = "baseUrl" id = "baseUrl" value = "<?php echo base_url();?>"/>
	</div>
</div>
<br/>
<hr/>
<script src="<?php echo base_url('/application/Content/Js/angular.min.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/app/ShoppingCart.model.js')?>"></script>
<script type="text/javascript">
	$('document').ready( function () {
    $('#clickBinding').click();
  });
</script>
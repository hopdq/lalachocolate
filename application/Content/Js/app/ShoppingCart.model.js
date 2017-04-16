var app = angular.module('shoppingCartApp', []);
	app.controller('shoppingCartController', function ($scope) {
		$scope.baseUrl = $('#baseUrl').val();
		$scope.customerId = "0";
		$scope.productsList = [];
		$scope.totalMoney = 0;
		$scope.totalProduct = 0;
		// $scope.productsListLen = $scope.productsList.length;
		//
		$scope.init = function () {
			$.ajax({
				url: $scope.baseUrl + 'index.php/Order/GetCart',
				type: 'GET',
				success: function (data) {
					if (data != "-1") {
						var cartData = JSON.parse(data);
						$scope.customerId = cartData.customerId;
						var tmpProductsList = cartData.productsList;
						for (var i = 0; i < tmpProductsList.length; i ++) {
							var product = tmpProductsList[i];
							product.productQuantity = {};
							product.productQuantity.availableOptions= [];
							for (var j = 0; j < 20; j ++) {
								product.productQuantity.availableOptions[j] = {};
								product.productQuantity.availableOptions[j].Key = j+1;
								product.productQuantity.availableOptions[j].Quantity = j+1;
							}
							product.productQuantity.selectedOption = {};
							if (parseInt(product.Quantity) > 20) {
								product.productQuantity.selectedOption.Key = 20;
								product.productQuantity.selectedOption.Quantity = 20;
							}
							else {
								product.productQuantity.selectedOption.Key = product.Quantity;
								product.productQuantity.selectedOption.Quantity = product.Quantity;
							}
						}
						$scope.productsList = tmpProductsList;
						$scope.totalMoney = $scope.calculateTotalMoney($scope.productsList);
						$scope.totalProduct = $scope.calculateTotalProducts($scope.productsList);
						$scope.$apply();
					}
					else {
						$scope.$apply();
					}
				}
			});
		}
		//
		$scope.calculateTotalMoney = function (proList) {
			var totalMoney = 0;
			for (var i = 0; i < proList.length; i ++) {
				var product = proList[i];
				if (product.IsPercentPromotion == "0") {
					totalMoney += parseInt(product.Quantity) * (parseInt(product.Price) - parseInt(product.PromotionValue));
				}
				else {
					totalMoney += parseInt(product.Quantity) * parseInt(product.Price) * (1 - parseInt(product.PromotionValue)/100);
				}
			}
			return totalMoney;
		}
		//
		$scope.calculateTotalProducts = function (proList) {
			var totalProducts = 0;
			for (var i = 0; i < proList.length; i ++) {
				var product = proList[i];
				totalProducts += parseInt(product.Quantity);
			}
			return totalProducts;
		}
		//
		$scope.selectQuantity = function (proId) {
			var proQuan = 0;
			for (var i = 0; i < $scope.productsList.length; i ++) {
				var product = $scope.productsList[i];
				if (product.Id == proId) {
					product.Quantity = product.productQuantity.selectedOption.Quantity;
					proQuan = product.Quantity;
				}
			}
			$scope.totalMoney = $scope.calculateTotalMoney($scope.productsList);
			$scope.totalProduct = $scope.calculateTotalProducts($scope.productsList);
			$.ajax({
				url: $scope.baseUrl + 'index.php/Order/ChangeProductQuantity',
				data: {productId: proId, productQuantity: proQuan},
				type: 'POST',
				success: function (data) {
					//do somethings here.
				}
			});
		}
		//
		$scope.removeProduct = function (proId) {
			var idx = 0;
			for (var i = 0; i < $scope.productsList.length; i ++) {
				var product = $scope.productsList[i];
				if (product.Id == proId) {
					idx = i;
					break;
				}
			}
			var proName = $scope.productsList[idx].Name
			var cnf = confirm('Bạn muốn loại bỏ sản phẩm ' + proName +' ra khỏi giỏ hàng ?');
			if (cnf) {
				$.ajax({
					url: $scope.baseUrl + 'index.php/Order/RemoveProduct',
					data: {productId: proId},
					type: 'POST',
					success: function (data) {
						if (data != '-1') {
							$scope.productsList.splice(idx,1);
							$scope.totalMoney = $scope.calculateTotalMoney($scope.productsList);
							$scope.totalProduct = $scope.calculateTotalProducts($scope.productsList);
							$scope.$apply();
						}
						else {
							alert('Xảy ra lỗi ! Vui lòng thao tác lại !');
						}
					}
				});
			}
			else {
				return false;
			}
		}
		//
		$scope.payment = function () {
			window.location.href = $scope.baseUrl + 'index.php/Payment';
		}
	});
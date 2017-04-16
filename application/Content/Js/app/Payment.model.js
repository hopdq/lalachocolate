var app = angular.module('PaymentApp', []);
//
	app.controller('stepOneController', function ($scope) {
		$scope.baseUrl = $('#baseUrl').val();
		$scope.customerStatus = "0";
		$scope.init = function () {
			$('#confirmPassword').hide();
			$('#toLoginLabel').hide();
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/CheckLoggedIn',
				type: "POST",
				success: function(data) {
					if (data != "-1") {
						$scope.customerStatus = "1";
						$scope.$apply();
					}
					else {
						$scope.customerStatus = "0";
						$scope.$apply();
					}
				}
			});
		}
		//
		$scope.toRegist = function () {
			$("#confirmPassword").show(250);
			$('#toRegistLabel').hide(50);
			$('#toLoginLabel').show(50);
			$('#submitBtn1').html('Đăng ký');
		}
		//
		$scope.toLogin = function () {
			$("#confirmPassword").hide(250);
			$('#toRegistLabel').show(50);
			$('#toLoginLabel').hide(50);
			$('#submitBtn1').html('Đăng nhập');
		}
		//
	});
//
	app.controller('stepTwoController', function ($scope) {
		alert('ok');
		$scope.customerStatus = "0";
		$scope.init = function () {
			$scope.customerStatus = customerStatus;
			alert($scope.customerStatus);
		}
		//
	});
//
	app.controller('stepThreeController', function ($scope) {
		//
	});
//
	app.controller('billController', function ($scope) {
		$scope.baseUrl = $('#baseUrl').val();
		$scope.productsList = [];
		$scope.totalMoney = 0;
		$scope.totalOriginMoney = 0;
		$scope.totalProduct = 0;
		$scope.totalPromotionMoney = 0;
		$scope.customerId = "0";
		$scope.customerStatus = "0";
		$scope.curCustomer  = {};
		$scope.init = function () {
			$('#confirmPassword').hide();
			$('#toLoginLabel').hide();
			$.ajax({
				url: $scope.baseUrl + 'index.php/Order/GetCart',
				type: 'GET',
				success: function (data) {
					if (data != "-1") {
						var cartData = JSON.parse(data);
						$scope.customerId = cartData.customerId;
						if ($scope.customerId == "0") {
							$scope.customerStatus = "0";
						}
						else {
							$scope.customerStatus = "1";
						}
						var tmpProductsList = cartData.productsList;
						$scope.productsList = tmpProductsList;
						$scope.totalMoney = $scope.calculateTotalMoney($scope.productsList);
						$scope.totalProduct = $scope.calculateTotalProducts($scope.productsList);
						$scope.totalOriginMoney = $scope.calculateTotalOriginMoney($scope.productsList);
						$scope.totalPromotionMoney = $scope.totalPromotionMoney($scope.productsList);
						$scope.$apply();
					}
					else {
						$scope.$apply();
					}
				}
			});
		}
		//
		$scope.totalPromotionMoney = function (proList) {
			var totalMoney = 0;
			for (var i = 0; i < proList.length; i ++) {
				var product = proList[i];
				if (product.IsPercentPromotion == "0") {
					totalMoney += parseInt(product.Quantity) * parseInt(product.PromotionValue);
				}
				else {
					totalMoney += parseInt(product.Quantity) * parseInt(product.Price) * parseInt(product.PromotionValue)/100;
				}
			}
			return totalMoney;
		}
		//
		$scope.calculateTotalOriginMoney = function (proList) {
			var totalMoney = 0;
			for (var i = 0; i < proList.length; i ++) {
				var product = proList[i];
				totalMoney += parseInt(product.Quantity) * parseInt(product.Price);
			}
			return totalMoney;
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
		$scope.next = function (stt) {
			$scope.customerStatus = parseInt(stt) + 1;
		}
		//
		$scope.back = function (stt) {
			$scope.customerStatus = parseInt(stt) - 1;
		}
	});
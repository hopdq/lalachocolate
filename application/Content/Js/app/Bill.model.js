var app = angular.module('BillApp', []);
	app.controller('BillController', function ($scope) {
		$scope.baseUrl = $('#baseUrl').val();
		$scope.productsList = [];
		$scope.totalMoney = 0;
		$scope.totalOriginMoney = 0;
		$scope.totalProduct = 0;
		$scope.totalPromotionMoney = 0;
		$scope.init = function () {
			$('#confirmPassword').hide();
			$('#toLoginLabel').hide();
			$.ajax({
				url: $scope.baseUrl + 'index.php/Order/GetCart',
				type: 'GET',
				success: function (data) {
					if (data != "-1") {
						var cartData = JSON.parse(data);
						var tmpProductsList = cartData.productsList;
						$scope.productsList = tmpProductsList;
						$scope.totalMoney = $scope.calculateTotalMoney($scope.productsList);
						$scope.totalProduct = $scope.calculateTotalProducts($scope.productsList);
						$scope.totalOriginMoney = $scope.calculateTotalOriginMoney($scope.productsList);
						$scope.totalPromotionMoney = $scope.totalPromotionMoney($scope.productsList);
						$scope.$apply();
					}
					else {
						//
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
	});
var app = angular.module('profileApp', []);
	app.controller('profileController', function ($scope) {
		$scope.baseUrl = $('#baseUrl').val();
		$scope.curCustomer = {};
		//
		$scope.init = function () {
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/GetCurrentCustomerInfo',
				data: {},
				type: 'GET',
				success: function (data) {
					var cus = JSON.parse(data);
					$scope.curCustomer = cus;
					$scope.$apply();
				}
			});
		}
	});
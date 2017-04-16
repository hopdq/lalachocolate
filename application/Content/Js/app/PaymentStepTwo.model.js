var app = angular.module('StepTwoApp', []);
//
	app.controller('stepTwoController', function ($scope) {
		$scope.curCustomer = {};
		$scope.provincesList = [];
		$scope.baseUrl = $('#baseUrl').val();
		$scope.provincesName = {};
		$scope.districtsName = {};
		$scope.availableDistricts = [];
		$scope.init = function () {
			$scope.curCustomer.Id = $('#cusId').val();
			$scope.curCustomer.Name = $('#customerName').val();
			$scope.curCustomer.ProvinceId = $('#provinceId').val();
			$scope.curCustomer.DistrictId = $('#districtId').val();
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/GetAllProvinces',
				type: 'GET',
				success: function (data) {
					$scope.provincesList = JSON.parse(data)['provincesList'];
					$scope.provincesName.availableOptions = [];
					for (var i = 0; i < $scope.provincesList.length; i ++) {
						$scope.provincesName.availableOptions[i] = {};
						$scope.provincesName.availableOptions[i].Id = $scope.provincesList[i].Id;
						$scope.provincesName.availableOptions[i].Name = $scope.provincesList[i].Name;
						if ($scope.provincesList[i].Id == $scope.curCustomer.ProvinceId) {
							$scope.curCustomer.ProvinceName = $scope.provincesList[i].Name;
							for (var j = 0; j < $scope.provincesList[i]['districtsList'].length; j ++) {
								if ($scope.provincesList[i]['districtsList'][j].Id == $scope.curCustomer.DistrictId) {
									$scope.curCustomer.DistrictName = $scope.provincesList[i]['districtsList'][j].Name;
								}
							}
						}
					}
					$scope.provincesName.availableOptions.unshift({Id: '-1', Name :"---------------------Tỉnh/Thành phố---------------------" });
					$scope.provincesName.selectedOption = {Id: '-1', Name :"---------------------Tỉnh/Thành phố---------------------" };
					//
					$scope.districtsName.availableOptions = [];
					$scope.districtsName.availableOptions.unshift({Id: '-1', Name :"------------------Quận/Huyện/Thị xã------------------" });
					$scope.districtsName.selectedOption = {Id: '-1', Name :"------------------Quận/Huyện/Thị xã------------------" };
					//
					if ($scope.curCustomer.ProvinceId != "0") {
						$scope.provincesName.selectedOption = {Id: $scope.curCustomer.ProvinceId, Name : $scope.curCustomer.ProvinceName};
						$scope.showDistricts();
						$scope.districtsName.selectedOption = {Id: $scope.curCustomer.DistrictId, Name : $scope.curCustomer.DistrictName};
					}
					$scope.$apply();
					//
				}
			})
		}
		//
		//
		$scope.showDistricts = function () {
			var selectedId = $scope.provincesName.selectedOption.Id;
			$scope.curCustomer.ProvinceId = selectedId;
			$scope.curCustomer.ProvinceName = $scope.provincesName.selectedOption.Name;
			var prvList = $scope.provincesList;
			for (var i = 0; i < prvList.length; i ++) {
				if (selectedId == prvList[i].Id) {
					for (var j = 0; j < prvList[i]['districtsList'].length; j ++) {
						$scope.availableDistricts[j] = {};
						$scope.availableDistricts[j].Id = prvList[i]['districtsList'][j].Id;
						$scope.availableDistricts[j].Name = prvList[i]['districtsList'][j].Name;
					}
				}
			}
			$scope.districtsName.availableOptions = $scope.availableDistricts;
			$scope.availableDistricts = [];
			$scope.districtsName.availableOptions.unshift({Id: '-1', Name :"------------------Quận/Huyện/Thị xã------------------" });
			$scope.districtsName.selectedOption = {Id: '-1', Name :"------------------Quận/Huyện/Thị xã------------------" };
		}
		//
		$scope.selectedDistrict = function () {
			$scope.curCustomer.DistrictId = $scope.districtsName.selectedOption.Id;
			$scope.curCustomer.DistrictName = $scope.districtsName.selectedOption.Name;
		}
		//

		//
		$scope.checkingEmail = function (curEmail) {
			var email = curEmail;
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/CheckingEmail',
				data: {checkedEmail: email},
				type: 'POST',
				success: function (data) {
					alert(data);
					if (data == '1') {
						return true;
					}
					else {
						return false;
					}
				}
			});
		}
		//
		$scope.validateCustomerInfo = function () {
			if (typeof($scope.curCustomer.ProvinceId) == 'undefined'||$scope.curCustomer.ProvinceId == '-1') {
				alert('Vui lòng chọn Tỉnh/Thành phố !');
				return false;
			}
			else if (typeof($scope.curCustomer.DistrictId) == 'undefined'|| $scope.curCustomer.DistrictId == '-1') {
				alert('Vui lòng chọn Quận/Huyện/Thị xã !');
				return false;
			}
			else {
				return true;
			}
		}
		//
		$scope.payment = function () {
			var $registerForm = $("#addingCustomerForm").validate({
                // Rules for form validation
                rules : {
                    customerName : {
                        required : true
                    },
                    customerEmail : {
                        required : true,
                        email : true
                    },
                    customerPhone : {
                        required : true
                    },
                    customerAddress : {
                        required : true
                    },
                    customerPassword : {
                        required : true,
                        minlength : 3,
                        maxlength : 20
                    },
                    customerConfirmPassword : {
                        required : true,
                        minlength : 3,
                        maxlength : 20,
                        equalTo : '#customerPassword'
                    }
                },

                // Messages for form validation
                messages : {
                    customerName : {
                        required : 'Vui lòng nhập tên người dùng !'
                    },
                    customerEmail : {
                        required : 'Vui lòng nhập địa chỉ e-mail người dùng !',
                        email : 'Vui lòng nhập địa chỉ E-mail hợp lệ !'
                    },
                    customerPhone : {
                        required : 'Vui lòng nhập số điện thoại !',
                    },
                    customerAddress : {
                        required : 'Vui lòng nhập địa chỉ (Số nhà - Đường) !',
                    },
                    customerPassword : {
                        required : 'Nhập mật khẩu(chứa ít nhất 3 kí tự) !'
                    },
                    customerConfirmPassword : {
                        required : 'Vui lòng nhập lại mật khẩu !',
                        equalTo : 'Vui lòng nhập mật khẩu trùng với mật khẩu bên trên !'
                    }
                },

                // Do not change code below
                errorPlacement : function(error, element) {
                    error.insertAfter(element.parent());
                    return false;
                }
            });
			var checkedForm = $('#addingCustomerForm').valid();
			if ( checkedForm && $scope.validateCustomerInfo()) {
				$scope.completePayment();
			}
			else {
				return false;
			}
		}
		//
		$scope.completePayment = function () {
			$scope.curCustomer.Name = $('#customerName').val();
			$scope.curCustomer.Phone = $('#customerPhone').val();
			$scope.curCustomer.Address = $('#customerAddress').val();
			$scope.curCustomer.Note = '' + $('#note').val();
			var shipInfo = JSON.stringify($scope.curCustomer);
			$.ajax({
				url: 'http://localhost/bepnhat/index.php/Payment/CompletePayment',
				data: {shipInfo: shipInfo},
				type: "POST",
				success: function(data) {
					if (data == "1") {
						alert('Đặt hàng thành công !Chi tiết đơn hàng đã được gửi vào email của quý khách.');
						window.location.href = $scope.baseUrl;
						$scope.$apply();
					}
					else {
						alert("Xảy ra lỗi ! Vui lòng thao tác lại.");
						$scope.$apply();
					}
				}
			});

		}
		//
	});
//
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
						$scope.totalMoney = 0;
						$scope.totalOriginMoney = 0;
						$scope.totalProduct = 0;
						$scope.totalPromotionMoney = 0;
						$scope.$apply()
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
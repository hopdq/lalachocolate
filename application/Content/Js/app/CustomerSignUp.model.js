var app = angular.module('signUpApp', []);
	app.controller('signUpController', function ($scope) {
		$scope.newCustomer = {};
		$scope.provincesList = [];
		$scope.baseUrl = $('#baseUrl').val();
		$scope.provincesName = {};
		$scope.districtsName = {};
		$scope.availableDistricts = [];
		$scope.init = function () {
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/GetAllProvinces',
				type: 'GET',
				success: function (data) {
					//alert(data);
					$scope.provincesList = JSON.parse(data)['provincesList'];
					$scope.provincesName.availableOptions = [];
					for (var i = 0; i < $scope.provincesList.length; i ++) {
						$scope.provincesName.availableOptions[i] = {};
						$scope.provincesName.availableOptions[i].Id = $scope.provincesList[i].Id;
						$scope.provincesName.availableOptions[i].Name = $scope.provincesList[i].Name;
					}
					$scope.provincesName.availableOptions.unshift({Id: '-1', Name :"---------------------Tỉnh/Thành phố---------------------" });
					$scope.provincesName.selectedOption = {Id: '-1', Name :"---------------------Tỉnh/Thành phố---------------------" };
					//
					$scope.districtsName.availableOptions = [];
					$scope.districtsName.availableOptions.unshift({Id: '-1', Name :"------------------Quận/Huyện/Thị xã------------------" });
					$scope.districtsName.selectedOption = {Id: '-1', Name :"------------------Quận/Huyện/Thị xã------------------" };
					//
					$scope.$apply();
					//
				}
			})
		}
		//
		$scope.showDistricts = function () {
			var selectedId = $scope.provincesName.selectedOption.Id;
			$scope.newCustomer.ProvinceId = selectedId;
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
			$scope.newCustomer.DistrictId = $scope.districtsName.selectedOption.Id;
		}
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
			if (typeof($scope.newCustomer.ProvinceId) == 'undefined'||$scope.newCustomer.ProvinceId == '-1') {
				alert('Vui lòng chọn Tỉnh/Thành phố !');
				return false;
			}
			else if (typeof($scope.newCustomer.DistrictId) == 'undefined'|| $scope.newCustomer.DistrictId == '-1') {
				alert('Vui lòng chọn Quận/Huyện/Thị xã !');
				return false;
			}
			else {
				return true;
			}
		}
		//
		$scope.signUp = function () {
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
				var email = $scope.newCustomer.Email;
				$.ajax({
					url: $scope.baseUrl + 'index.php/Customer/CheckingEmail',
					data: {checkedEmail: email},
					type: 'POST',
					success: function (data) {
						if (data == '1') {
							$scope.completeSignUp();
							$scope.$apply();
						}
						else {
							alert('Email đã tồn tại ! Vui lòng chọn Email khác !');
							return false;
						}
					}
				});
			}
			else {
				return false;
			}
		}
		//
		$scope.completeSignUp = function () {
			var cusData = JSON.stringify($scope.newCustomer);
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/SignUpProcess',
				data: {customerInfo: cusData},
				type: 'POST',
				success: function (data) {
					if (data != '0') {
						$('#loginEmail').val($scope.newCustomer.Email);
						$('#loginPassword').val($scope.newCustomer.Password);
						alert('Chúc mừng bạn đã đăng kí thành công !');
						$scope.signIn();
						$scope.$apply();
						return true;
					}
					else {
						return false;
					}
				}
			});
			//
		}
		//
		$scope.signIn = function () {
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/LoginProcess',
				data: {loginEmail:$scope.newCustomer.Email, loginPassword:$scope.newCustomer.Password},
				type: 'POST',
				success: function (data) {
					if (data == '1') {
						window.location.href = $scope.baseUrl;
						return true;
					}
					else {
						return false;
					}
				}
			});
		}
	});
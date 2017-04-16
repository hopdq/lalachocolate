var app = angular.module('StepOneApp', []);
//
	app.controller('stepOneController', function ($scope) {
		$scope.baseUrl = $('#baseUrl').val();
		$scope.cusStatus = "1";
		$scope.newCustomer = {};
		$scope.init = function () {
			$('#confirmPassword').hide();
			$('#name').hide();
			$('#toLoginLabel').hide();
			$.ajax({
				url: $scope.baseUrl + 'index.php/Customer/CheckLoggedIn',
				type: "POST",
				success: function(data) {
					if (data != "-1") {
						$scope.$apply();
					}
					else {
						$scope.$apply();
					}
				}
			});
		}
		//
		$scope.toRegist = function () {
			$scope.cusStatus = "0";
			$("#confirmPassword").show(250);
			$("#name").show(250);
			$('#toRegistLabel').hide(50);
			$('#toLoginLabel').show(50);
		}
		//
		$scope.toLogin = function () {
			$scope.cusStatus = "1";
			$("#confirmPassword").hide(250);
			$("#name").hide(250);
			$('#toRegistLabel').show(50);
			$('#toLoginLabel').hide(50);
		}
		//
		$scope.loginPayment = function () {
			var email = $('#email').val();
			var pass = $('#password').val();
			$.ajax({
            url: 'http://localhost/bepnhat/index.php/Customer/LoginProcess',
            data: {loginEmail:email, loginPassword:pass},
            type: 'POST',
            success: function(data){
                if (data != '-1') {
                    window.location.href = "http://localhost/bepnhat/index.php/Payment";
                }
                else {
                    alert('Email hoặc mật khẩu không đúng ! Vui lòng nhập lại');
                }
            }
        });
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
		$scope.signUpPayment = function () {
			var $registerForm = $("#addingCustomerForm").validate({
                // Rules for form validation
                rules : {
                    name : {
                        required : true
                    },
                    email : {
                        required : true,
                        email : true
                    },
                    password : {
                        required : true,
                        minlength : 3,
                        maxlength : 20
                    },
                    confirmPassword : {
                        required : true,
                        minlength : 3,
                        maxlength : 20,
                        equalTo : '#password'
                    }
                },

                // Messages for form validation
                messages : {
                    name : {
                        required : 'Vui lòng nhập tên người dùng !'
                    },
                    email : {
                        required : 'Vui lòng nhập địa chỉ e-mail người dùng !',
                        email : 'Vui lòng nhập địa chỉ E-mail hợp lệ !'
                    },
                    password : {
                        required : 'Nhập mật khẩu(chứa ít nhất 3 kí tự) !'
                    },
                    confirmPassword : {
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
			if ( checkedForm) {
				$scope.newCustomer.Name = $('#name').val();
				$scope.newCustomer.Email = $('#email').val();
				$scope.newCustomer.Password = $('#password').val();
				$scope.newCustomer.Phone = "";
				$scope.newCustomer.Address = "";
				$scope.newCustomer.ProvinceId = "0";
				$scope.newCustomer.DistrictId = "0";
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
					if (data != '-1') {
						alert('Chúc mừng bạn đã đăng kí thành công !');
						$scope.loginPayment();
						$scope.$apply();
					}
					else {
						alert("Xay ra loi ! Vui long thao tac lai.");
					}
				}
			});
			//
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
						$scope.$apply();
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
<style>
<!--
*.input {
    width: 100%;
}
*.input.invalid {
    color: red;
}
#addingUserPopup {
    background-color: white;
}
.jarviswidget > header{
    width: 100%;
    padding: 0px 13px;
}
-->
</style>
<div id="form"  ng-app = 'signUpApp'><!--form-->
    <div class="container"  ng-controller = 'signUpController'>
        <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <div class="login-form"><!--login form-->
                    <h2>Đăng nhập</h2>
                    <form method = "POST">
                        <input type="email" name = "loginEmail" id = "loginEmail" placeholder="Email đăng nhập" />
                        <input type="password" name = "loginPassword" id = "loginPassword" placeholder="Mật khẩu" />
                        <button id = "loginBtn" class="btn btn-default" onclick = "checkLogin();">Đăng nhập</button>
                    </form>
                </div><!--/login form-->
            </div>
            <div class="col-sm-1">
                <h2 class="or">Hoặc</h2>
            </div>
            <!-- signup field -->
            <div class="col-sm-4">
                    <div id = "addingUserPopup">
            <div class="jarviswidget jarviswidget-sortable" role="widget">
            <div role="content">
            <div class="dt-wrapper" id="DtWrapper">
                <div class="widget-body no-padding">
                <div class="signup-form"><!--sign up form-->
                    <h2>Đăng ký mới!</h2>
                    <form id="addingCustomerForm" class="smart-form" novalidate="novalidate" method="POST">
                            <label class="input">
                                <input ng-model = 'newCustomer.Name' type="text" name = "customerName" id = "customerName" placeholder="Tên"/>
                                <b class="tooltip tooltip-bottom-right">Nhập tên người dùng</b> </label>
                        
                        
                            <label class="input">
                                <input ng-model = 'newCustomer.Phone' type="text" name = "customerPhone" id = "customerPhone" placeholder="Số điện thoại"/>
                                <b class="tooltip tooltip-bottom-right">Nhập số diện thoại</b> </label>

                            <label class="input">
                                <input ng-model = 'newCustomer.Address' type="text" name = "customerAddress" id = "customerAddress" placeholder="Địa chỉ"/>
                                <b class="tooltip tooltip-bottom-right">Nhập địa chỉ</b> </label>

                            <label class="input">
                                <input ng-model = 'newCustomer.Email' type="email" name = "customerEmail" id = "customerEmail" placeholder="Email"/>
                                <b class="tooltip tooltip-bottom-right">Nhập địa chỉ E-mail người dùng</b> </label>

                            <label class="input">
                                <input ng-model = 'newCustomer.Password' type="password" name = "customerPassword" id = "customerPassword" placeholder="Mật khẩu"/>
                                <b class="tooltip tooltip-bottom-right">Nhập mật khẩu ( ít nhất 3 kí tự)</b> </label>

                            <label class="input">
                                <input ng-model = 'newCustomer.ConfirmPassword' type="password" name = "customerConfirmPassword" id = "customerConfirmPassword" placeholder="Nhập lại mật khẩu"/>
                                <b class="tooltip tooltip-bottom-right">Nhập lại mật khẩu đăng nhập</b> </label>
                        <br/>
                        <p><i></i></p>
                        <select ng-change = "showDistricts();" ng-options = "option.Name for option in provincesName.availableOptions track by option.Id" ng-model = "provincesName.selectedOption">
                        </select>
                        <p><i></i></p>
                        <select ng-change = "selectedDistrict();" ng-options = "option.Name for option in districtsName.availableOptions track by option.Id" ng-model = "districtsName.selectedOption">
                        </select>
                        <div style="height:10px;"></div>
                        <button id = "submitBtn" ng-click = 'signUp();' class="btn btn-default">Đăng ký</button>
                    </form>
                    <input type = "hidden" ng-click = "init()" id = 'clickBinding'/>
                    <input type = "hidden" name = "baseUrl" id = "baseUrl" value = "<?php echo base_url();?>"/>
                </div><!--/sign up form-->
            </div>
        </div>
        </div>
        </div>
        </div>
        </div>
    </div>
    </div>
</div><!--/form-->
<script src="<?php echo base_url('/application/Content/Js/angular.min.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/app/CustomerSignUp.model.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.form.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.validate.min.js')?>"></script>
<script type="text/javascript">
  //
  $('document').ready( function () {
    $('#clickBinding').click();
  });
  //
  function checkLogin() {
    var email = $('#loginEmail').val();
    var password = $('#loginPassword').val();
    $.ajax({
            url: 'http://localhost/bepnhat/index.php/Customer/LoginProcess',
            data: {loginEmail:email, loginPassword:password},
            type: 'POST',
            success: function(data){
                if (data != '-1') {
                    window.location.href = "http://localhost/bepnhat/index.php";
                }
                else {
                    alert('Email hoặc mật khẩu không đúng ! Vui lòng nhập lại');
                }
            }
        });
    }
</script>
<style type="text/css">
    #paymentPage {
        z-index: 100;
    }
    /**/
</style>
<div ng-app = "StepOneApp" class="form-group row col-lg-12" style="margin-top: 2%;" id = "paymentPage">
    <div class="container">
        <div class="container form-group row col-lg-8 col-lg-offset-0">

            <div class="step-one" ng-controller = "stepOneController">
                <form class="modal-content" id="addingCustomerForm">
                    <div class="modal-header">
                        <div class="head">
                        <h2 class="heading">Bước 1 : Đăng nhập</h2>
                            <p id = "toRegistLabel">
                                <span>Bạn chưa có tài khoản? </span>
                                <a href="#" ng-click = "toRegist();">Đăng ký</a>
                            </p>
                            <p id = "toLoginLabel">
                                <span>Tôi đã có tài khoản : </span>
                                <a href="#" ng-click = "toLogin();">Đăng nhập</a>
                            </p>
                        </div>
                    </div>
                    <div class="modal-body">
                         <form class="content" method="POST">
                            <div class="form-group popup_email">
                                <input id="name" class="form-control login" name="name" placeholder="Nhập họ tên" data-error="Vui lòng nhập họ tên!">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group popup_email">
                                <input id="email" type="email" class="form-control login" name="email" placeholder="Nhập Email" data-error="Vui lòng nhập email!">
                                <span class="help-block"></span>
                            </div>

                            <div class="form-group popup_password" id="popup_password">
                                <input type="password" id="password" class="form-control login" name="password" placeholder="Nhập mật khẩu" autocomplete="off" data-error="Vui lòng nhập mật khẩu!">
                                <span class="help-block"></span>
                            </div>
                             <div>
                                <input type="password" id="confirmPassword" class="form-control login" name="confirmPassword" placeholder="Nhập lại mật khẩu" autocomplete="off">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <button ng-if = "cusStatus == '1'" ng-click = "loginPayment();" type="button" id="submitBtn1" class="btn btn-info btn-block">Đăng nhập</button>
                                <button ng-if = "cusStatus == '0'" ng-click = "signUpPayment();" type="button" id="submitBtn2" class="btn btn-info btn-block">Đăng ký nhanh</button>
                            </div>
                        </form>
                    </div>
                </form>
                <input type = "hidden" class = "clickBinding" ng-click = "init();"/>
            </div>
        </div>
        <div ng-controller = "BillController" class="form-group row col-lg-4 col-lg-offset-0">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="head">
                        <p class="heading">{{'Đơn hàng' + ' \( ' +totalProduct + ' sản phẩm \)'}}</p>
                    </div>
                </div>
                <div class="modal-body">
                    <div class = "form-group row scrollField" id = "productsList">
                        <div class = "form-group row" ng-repeat = "product in productsList">
                            <div class="col-md-2"><img ng-src="{{baseUrl + product.ImagePath}}" alt = "{{product.Name}}" height="150%" width="150%" /></div>
                            <div class="col-md-6"><p style="color:#0000e6;font-size:80%;">{{product.Quantity + ' x ' + product.Name}}</p></div>
                            <div class = "col-md-4"><p style="color:#006600;font-size:90%;">{{product.Quantity * product.Price + " ₫"}}</p></div>
                        </div>
                    </div>
                    <div><hr/></div>
                    <div class = "form-group row">
                        <div class="col-md-7">
                            <p>Tổng gốc :</p>
                        </div>
                        <div class="col-md-5">
                            <p style="color:#006600;font-size:90%;">{{totalOriginMoney + " ₫"}}</p>
                        </div>
                    </div>
                    <div class = "form-group row">
                        <div class="col-md-7">
                            <p>Tổng khuyến mại :</p>
                        </div>
                        <div class="col-md-5">
                            <p style="color:#006600;font-size:90%;">{{totalPromotionMoney + " ₫"}}</p>
                        </div>
                    </div>
                    <div><hr/></div>
                    <div class = "form-group row">
                        <div class="col-md-5">
                            <p>Thành tiền :</p>
                        </div>
                        <div class="col-md-7">
                            <p style="color:#e60000;font-size:125%;">{{totalMoney + " ₫"}}</p>
                        </div>
                    </div>
                </div>
            </div>
            <input type = "hidden" class = "clickBinding" ng-click = "init();"/>
        </div>
    </div>
    <input type = "hidden" name = "baseUrl" id = "baseUrl" value = "<?php echo base_url();?>"/>
</div>
<br/>
<hr/>
<script src="<?php echo base_url('/application/Content/Js/angular.min.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/app/PaymentStepOne.model.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.form.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.validate.min.js')?>"></script>

<script type="text/javascript">
    $('document').ready( function () {
    $('.clickBinding').click();
  });
</script>

<style type="text/css">
    #paymentPage {
        z-index: 100;
    }
    /**/
</style>
<div ng-app = "PaymentApp" class="form-group row col-lg-12" style="margin-top: 2%;" id = "paymentPage">
    <div class="container">
        <div class="container form-group row col-lg-8 col-lg-offset-0">

            <div class="step-one" ng-controller = "stepOneController">
                <div ng-if = 'customerStatus == "0" ' class="modal-content">
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
                                <input id="email" type="email" class="form-control login" name="email" placeholder="Nhập Email" data-error="Vui lòng nhập email!">
                                <span class="help-block"></span>
                            </div>

                            <div class="form-group popup_password" id="popup_password">
                                <input type="password" id="login_password" class="form-control login" name="password" placeholder="Nhập mật khẩu" autocomplete="off" data-error="Vui lòng nhập mật khẩu!">
                                <span class="help-block"></span>
                            </div>
                             <div>
                                <input type="password" id="confirmPassword" class="form-control login" name="confirmPassword" placeholder="Nhập lại mật khẩu" autocomplete="off">
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <button ng-click = "next('0');" type="button" id="submitBtn1" class="btn btn-info btn-block">Đăng nhập</button>
                            </div>
                        </form>
                    </div>
                </div>
                <input type = "hidden" class = "clickBinding" ng-click = "init();"/>
            </div>

            <div><br/></div>
            <div class="step-two" ng-controller = "stepTwoController">
                <div ng-if = 'customerStatus == "1" ' class="modal-content">
                    <div class="modal-header">
                        <div class="head">
                            <h2 class="heading">Bước 2 : Thông tin giao hàng</h2>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-default address-form is-edit" style="display: block;">
                            <div class="panel-body">
                                <div class="form-horizontal col-lg-offset-2" role="form" id="address-info">
                                    <div class="form-group row">
                                        <div class="col-lg-8">
                                            <label>
                                                <input type="text" name="customerName" class="form-control address" id="customerName" placeholder="Nhập họ tên" />
                                                <b class="tooltip tooltip-bottom-right">Nhập tên người dùng</b>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8">
                                            <label>
                                                <input type="tel" name="customerPhone" class="form-control address" id="customerPhone" placeholder="Nhập số điện thoại">
                                                <b class="tooltip tooltip-bottom-right">Nhập số diện thoại</b>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8">
                                            <select class="form-control address" ng-change = "showDistricts();" ng-options = "option.Name for option in provincesName.availableOptions track by option.Id" ng-model = "provincesName.selectedOption">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8">
                                            <select class="form-control address" ng-change = "selectedDistrict();" ng-options = "option.Name for option in districtsName.availableOptions track by option.Id" ng-model = "districtsName.selectedOption">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8">
                                            <label>
                                                <textarea name="street" class="form-control address" id="street" placeholder="Nhập địa chỉ"></textarea>
                                                <b class="tooltip tooltip-bottom-right">Nhập địa chỉ</b>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8">
                                            <textarea name="street" class="form-control" id="street" placeholder="Ghi chú"></textarea>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>                     
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <button ng-click = "next(1);">Tiep tuc</button>
                    </div>
                    <input type = "hidden" class = "clickBinding" ng-click = "init();"/>
                </div>
            </div>
            <div><br/></div>
            <div class="step-three" ng-controller = "stepThreeController">
                <div ng-if = 'customerStatus == "2" ' class="modal-content">
                    <div class="modal-header">
                        <div class="head">
                            <h2 class="heading">Bước 3 : Thanh toán và đặt mua</h2>
                        </div>
                    </div>
                    <div class="modal-body">
                        <p>ok thanh toan thooi!!</p>
                    </div>
                    <div>
                        <button ng-click = "back(2);">Quay lai</button>
                    </div>
                    <input type = "hidden" class = "clickBinding" ng-click = "init();"/>
                </div>
            </div>
        </div>
        <div ng-controller = "billController" class="form-group row col-lg-4 col-lg-offset-0" style="margin-top:2%;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="head">
                        <p class="heading">{{'Đơn hàng' + ' \( ' +totalProduct + ' sản phẩm \)'}}</p>
                    </div>
                </div>
                <div class="modal-body">
                    <div class = "form-group row scrollField" id = "productsList">
                        <div class = "form-group row" ng-repeat = "product in productsList">
                            <div class="col-md-8"><p style="color:#0000e6;font-size:80%;">{{product.Quantity + ' x ' + product.Name}}</p></div>
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
<!--     <input type = "hidden" name = "customerStatus" id = "customerStatus" value = "0"/>
 --><input type = "hidden" name = "baseUrl" id = "baseUrl" value = "<?php echo base_url();?>"/>
</div>
<br/>
<hr/>
<script src="<?php echo base_url('/application/Content/Js/angular.min.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/app/Payment.model.js')?>"></script>
<script type="text/javascript">
    $('document').ready( function () {
    $('.clickBinding').click();
  });
</script>

<style type="text/css">
    #paymentPage {
        z-index: 100;
    }
    *.inputField{

    }
    /**/
</style>
<?php
    $curCus = json_decode($data);
?>
<div ng-app = "StepTwoApp" class="form-group row col-lg-12" style="margin-top: 2%;" id = "paymentPage">
    <div class="container">
        <div class="container form-group row col-lg-8">
            <div class="step-two" ng-controller = "stepTwoController">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="head">
                            <h2 class="heading">Bước 2 : Thông tin giao hàng</h2>
                        </div>
                    </div>
                    <div class="modal-body"  style="margin-top:2%;">
                        <div class="panel panel-default" style="display: block;">
                            <div class="panel-body">
                                <div class="row col-lg-8 col-lg-offset-2 " style="margin-top:2%;">
                                    <form method="POST" id = "addingCustomerForm">
                                        <div class="row">
                                            <div>
                                                <input type="text" name="customerName" class="inputField form-control" id="customerName" value = "<?php echo $curCus->Name;?>" placeholder="Nhập họ tên" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div style="margin-top:2%;">
                                                <input type="tel" name="customerPhone" class="inputField form-control" id="customerPhone" value = "<?php echo $curCus->Phone;?>" placeholder="Nhập số điện thoại">
                                            </div>
                                        </div>
                                        <div type = "hidden">
                                            <input type = "hidden" value="<?php echo $curCus->Id;?>" id = "cusId"/>
                                            <input type = "hidden" value="<?php echo $curCus->ProvinceId;?>" id = "provinceId"/>
                                            <input type = "hidden" value="<?php echo $curCus->DistrictId;?>" id = "districtId"/>
                                        </div>
                                        <div class="row">
                                            <div style="margin-top:2%;">
                                                <select class="form-control inputField" ng-change = "showDistricts();" ng-options = "option.Name for option in provincesName.availableOptions track by option.Id" ng-model = "provincesName.selectedOption">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div style="margin-top:2%;">
                                                <select class="form-control inputField" ng-change = "selectedDistrict();" ng-options = "option.Name for option in districtsName.availableOptions track by option.Id" ng-model = "districtsName.selectedOption">
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div style="margin-top:2%;">
                                                <textarea name="customerAddress" id = "customerAddress" class="inputField form-control form-horizontal" placeholder="Nhập địa chỉ"><?php echo $curCus->Address;?></textarea>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div style="margin-top:2%;">
                                                <textarea name="note" class="inputField form-control" id="note" placeholder="Ghi chú"></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="form-horizontal col-lg-12"><hr/></div>
                                <div class="form-horizontal col-lg-12">
                                    <div class="row col-lg-4 col-lg-offset-1"  style="margin-bottom:2%;">
                                        <a class="btn btn-warning" style="font-size:110%;" href="http://localhost/bepnhat/"><i class="fa fa-arrow-left"></i>  Tiếp tục mua hàng</a>
                                    </div>
                                    <div class="col-lg-4 col-lg-offset-2"  style="margin-bottom:2%;">
                                        <a ng-click = "payment();" class="btn btn-success" style="font-size:110%;">Giao hàng tới đây  <i class="fa fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type = "hidden" class = "clickBinding" ng-click = "init();"/>
                </div>
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
                    <div class = "form-group row" ng-repeat = "product in productsList">
                        <div class="col-md-2"><img ng-src="{{baseUrl + product.ImagePath}}" alt = "{{product.Name}}" height="150%" width="150%" /></div>
                        <div class="col-md-6"><p style="color:#0000e6;font-size:80%;">{{product.Quantity + ' x ' + product.Name}}</p></div>
                        <div class = "col-md-4"><p style="color:#006600;font-size:90%;">{{product.Quantity * product.Price + " ₫"}}</p></div>
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
            <input type = "hidden" name = "baseUrl" id = "baseUrl" value = "<?php echo base_url();?>"/>
        </div>
    </div>
    <input type = "hidden" class = "clickBinding" ng-click = "init();"/>
    <input type = "hidden" name = "baseUrl" id = "baseUrl" value = "<?php echo base_url();?>"/>
</div>
<br/>
<hr/>
<script src="<?php echo base_url('/application/Content/Js/angular.min.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/app/PaymentStepTwo.model.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.validate.min.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.form.js')?>"></script>
<script type="text/javascript">
    $('document').ready( function () {
    $('.clickBinding').click();
  });
</script>
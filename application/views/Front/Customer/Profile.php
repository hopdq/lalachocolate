<style>
<!--
*.input {
    width: 100%;
}
#addingUserPopup {
    background-color: white;
}
-->
</style>
<div id="form"  ng-app = 'profileApp'><!--form-->
    <div class="container"  ng-controller = 'profileController'>
        <div class="row">
            <!-- signup field -->
            <div class="col-sm-6 col-sm-offset-2">
            <div id = "addingUserPopup">
            <div class="jarviswidget jarviswidget-sortable" role="widget">
            <div role="content">
            <div class="dt-wrapper" id="DtWrapper">
                <div class="widget-body no-padding">
                <div class="signup-form"><!--sign up form-->
                    <h2>Thông tin khách hàng</h2>
                    <form id="profileCustomerForm" class="smart-form" novalidate="novalidate" method="POST">
                            <label class="input">
                                <input style = "background:#ffffff" disabled = "disabled" ng-model = 'curCustomer.Name' type="text" name = "customerName" id = "customerName"/>
                            </label>
                        
                        
                            <label class="input">
                                <input style = "background:#ffffff" disabled = "disabled" ng-model = 'curCustomer.Phone' type="text" name = "customerPhone" id = "customerPhone"/>
                            </label>

                            <label class="input">
                                <input style = "background:#ffffff" disabled = "disabled" ng-model = 'curCustomer.Address' type="text" name = "customerAddress" id = "customerAddress"/>
                                <b class="tooltip tooltip-bottom-right">Nhập địa chỉ</b> </label>

                            <label class="input">
                                <input style = "background:#ffffff" disabled = "disabled" ng-model = 'curCustomer.Email' type="email" name = "customerEmail" id = "customerEmail"/>
                            </label>
                        <br/>
                        <div style="height:10px;"></div>
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
<script src="<?php echo base_url('/application/Content/Js/app/CustomerProfile.model.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.form.js')?>"></script>
<script src="<?php echo base_url('/application/Content/Js/jquery.validate.min.js')?>"></script>
<script type="text/javascript">
  //
  $('document').ready( function () {
    $('#clickBinding').click();
  });
</script>
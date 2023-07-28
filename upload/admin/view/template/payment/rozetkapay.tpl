<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-liqpay" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-liqpay" class="form-horizontal">

                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cogs text-primary"></i> <?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-order_status" data-toggle="tab" aria-expanded="false"> <?php echo $text_tab_order_status; ?></a></li>
                        <li><a href="#tab-view" data-toggle="tab" aria-expanded="false"><i class="fa fa-globe" aria-hidden="true"></i><?php echo $text_tab_view; ?></a></li>
                        <li><a href="#tab-test" data-toggle="tab" aria-expanded="false"><i class="fa fa-bug" aria-hidden="true"></i> 
                                <?php echo $text_tab_test; ?></a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">

                            <div class="form-group required">
                                <label class="col-sm-2 control-label"><?=$entry_login;?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="rozetkapay_login" value="<?=$rozetkapay_login;?>" class="form-control"/>
                                    <?php if ($error_login) { ?>
                                    <div class="text-danger"><?php echo $error_login; ?></div>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label"><?=$entry_password;?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="rozetkapay_password" value="<?=$rozetkapay_password;?>" class="form-control"/>
                                    <?php if ($error_password) { ?>
                                    <div class="text-danger"><?php echo $error_password; ?></div>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_qrcode_status; ?></label>
                                <div class="col-sm-4">
                                    <select name="rozetkapay_qrcode_status" class="form-control">
                                        <?php if ($rozetkapay_qrcode_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_send_info_customer_status; ?></label>
                                <div class="col-sm-2">
                                    <select name="rozetkapay_send_info_customer_status" class="form-control">
                                        <?php if ($rozetkapay_send_info_customer_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_send_info_products_status; ?></label>
                                <div class="col-sm-2">
                                    <select name="rozetkapay_send_info_products_status" class="form-control">
                                        <?php if ($rozetkapay_send_info_products_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_geo_zone_id" id="input-geo-zone" class="form-control">
                                        <option value="0"><?php echo $text_all_zones; ?></option>
                                        <?php foreach ($geo_zones as $geo_zone) { ?>
                                        <?php if ($geo_zone['geo_zone_id'] == $rozetkapay_geo_zone_id) { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_status" id="input-status" class="form-control">
                                        <?php if ($rozetkapay_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                                <div class="col-sm-10">
                                    <input type="text" name="rozetkapay_sort_order" value="<?php echo $rozetkapay_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="tab-order_status">


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $text_order_status_init; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_order_status_init" class="form-control">
                                        <option value="0" <?php if ($rozetkapay_order_status_init == "0") { ?>
                                            selected="selected"
                                            <?php } ?>>---</option>
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $rozetkapay_order_status_init) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"
                                                ><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $text_order_status_pending; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_order_status_pending" class="form-control">
                                        <option value="0" <?php if ($rozetkapay_order_status_pending == "0") { ?>
                                            selected="selected"
                                            <?php } ?>>---</option>
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $rozetkapay_order_status_pending) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"
                                                ><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $text_order_status_success; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_order_status_success" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $rozetkapay_order_status_success) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"
                                                ><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $text_order_status_failure; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_order_status_failure" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $rozetkapay_order_status_failure) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"
                                                ><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="tab-view">

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $text_view_title_default; ?></label>
                                <div class="col-sm-4">
                                    <select name="rozetkapay_view_title_default" class="form-control">
                                        <?php if ($rozetkapay_view_title_default) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $text_view_title; ?></label>
                                <div class="col-sm-4">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <img src="language/<?=$language['code'];?>/<?=$language['code'];?>.png" title="<?php echo $language['name']; ?>" />
                                        </span>
                                        <input type="text" name="rozetkapay_view_title[<?php echo $language['language_id']; ?>]" 
                                               value="<?php echo isset($rozetkapay_view_title[$language['language_id']]) ? 
                                               $rozetkapay_view_title[$language['language_id']] : ''; ?>" 
                                               minlength="5" maxlength="80" class="form-control" />
                                    </div>
                                    <?php if (isset($error_title[$language['language_id']])) { ?>
                                    <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $text_view_icon_status; ?> 
                                    <img src="/image/payment/rozetkapay/rpay.png" height="32">
                                </label>
                                <div class="col-sm-4">
                                    <select name="rozetkapay_view_icon_status" class="form-control">
                                        <?php if ($rozetkapay_view_icon_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab-test">
                            
                            <div class="form-group">
                                <div class="warning col-sm-12">
                                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> 
                                        <?php echo $text_help_test; ?>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_test_status" id="input-status" class="form-control">
                                        <?php if ($rozetkapay_test_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_log_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="rozetkapay_log_status" id="input-status" class="form-control">
                                        <?php if ($rozetkapay_log_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $text_test_cards; ?></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm">
                                        card=4242424242424242  exp=any cvv=any  3ds=Yes result=success<br>
                                        card=5454545454545454  exp=any cvv=any  3ds=Yes result=success<br>
                                        card=4111111111111111  exp=any cvv=any  3ds=No result=success<br>
                                        card=4200000000000000  exp=any cvv=any  3ds=Yes result=rejected<br>
                                        card=5105105105105100  exp=any cvv=any  3ds=Yes result=rejected<br>
                                        card=4444333322221111  exp=any cvv=any  3ds=No result=rejected<br>
                                        card=5100000020002000  exp=any cvv=any  3ds=No result=rejected<br>
                                        card=4000000000000044  exp=any cvv=any  3ds=No result=insufficient-funds<br>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="log_warning" class="form-group">
                                <div class="warning col-sm-12">
                                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> 
                                        <div id="log_warning_text"></div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-exclamation-triangle"></i> <?=$text_test_log_title;?></h3>
                                    <div class="pull-right">
                                        <a id="log_refresh" onclick="nt_log_refresh()" data-toggle="tooltip" class="btn btn-warning">
                                            <i class="fa fa-refresh"></i>
                                        </a>
                                        <a href="<?=$href_log_download;?>" data-toggle="tooltip" class="btn btn-primary">
                                            <i class="fa fa-download"></i>
                                        </a>
                                        <a href="<?=$href_log_clear;?>" data-toggle="tooltip" class="btn btn-danger">
                                            <i class="fa fa-eraser"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <textarea id="log" wrap="off" rows="15" readonly class="form-control"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function nt_log_refresh(){
        let but = $('#log_refresh')
        $('#log_warning').hide()
        $.ajax({
            url: '/admin/index.php?route=<?=$path;?>/logrefresh<?=$tokenUrl;?>',
            dataType: 'json',
            beforeSend: function () {
                but.hide()
            },
            complete: function () {
                but.show()
            },
            success: function (json) {                
                but.show()
                if(json.ok){
                    
                }else{
                    $('#log_warning_text').text(json.warning)
                    $('#log_warning').show()
                }
                $('#log').text(json.log)
            },
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(xhr);
            }
        });
        return false;
    }
    nt_log_refresh();
</script>
<?php echo $footer; ?>


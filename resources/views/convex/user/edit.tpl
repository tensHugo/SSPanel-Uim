{$pagename='edit'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
    <head>
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/sweetalert2.min.css">
    </head>
    <!--head结束区-->

    <body data-col="2-columns" class=" 2-columns ">
        <div class="wrapper">
            <!--main加载区（顶部nav和左侧菜单）-->
            {include file='user/main.tpl'}
            <!--main结束区（顶部nav和左侧菜单）-->
            <!--菜单页面开始区-->
            <div class="main-panel">
                <div class="main-content">
                    <div class="content-wrapper">
                        <!--菜单页内容开始-->
                        <section class="buttons-input-group" id="input-group-buttons">
                            <div class="row">
                                <div class="col-12 mt-3 mb-1">
                                    <div class="content-header">资料修改</div>
                                </div>
                            </div>
                            <div class="row match-height">
                                <div class="col-xl-4 col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title mb-0">用户名修改</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <fieldset>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="{$user->user_name}" id="newusername" placeholder="新用户名">
                                                        <div class="input-group-append">
                                                            <button class="btn btn-info" id="username-update"
                                                                type="button">修改</button>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title mb-0">IP解封</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <fieldset>
                                                    <div class="input-group">
                                                        <input type="text" value="当前状态：{$Block}" class="form-control"
                                                            placeholder="新用户名" readonly>
                                                        <div class="input-group-append">
                                                            <button class="btn btn-info" id="unblock"
                                                                type="button">解封</button>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-danger">
                                                <h4 class="card-title mb-0">每日使用报告</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <fieldset>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" value="{if $user->sendDailyMail == 2}TelegramBot接收{elseif $user->sendDailyMail == 1}邮件接收{else}不发送{/if}"
                                                            placeholder="不发送" readonly>
                                                        <div class="dropdown" placement="top-right">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-info dropdown-toggle"
                                                                    data-toggle="dropdown"
                                                                    id="dropdownBasic11">请选择</button>
                                                                <div class="dropdown-menu"
                                                                    aria-labelledby="dropdownBasic11">
                                                                    <button class="mail_btn dropdown-item" val="0" data="mail">不发送</button>
                                                                    <button class="mail_btn dropdown-item" val="1" data="mail">邮件接收</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-danger">
                                                <h4 class="card-title mb-0">联系方式修改</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <fieldset>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="im-type"
                                                            placeholder="QQ" value="{if $user->im_type==1}微信{/if}{if $user->im_type==2}QQ{/if}{if $user->im_type==4}Telegram{/if}{if $user->im_type==5}Discord{/if}" readonly>
                                                        <div class="dropdown" placement="top-right">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-info dropdown-toggle"
                                                                    data-toggle="dropdown"
                                                                    id="dropdownBasic11">请选择</button>
                                                                <div class="dropdown-menu"
                                                                    aria-labelledby="dropdownBasic11">
                                                                    <button class="wechat-btn dropdown-item" value="2" val="2">QQ</button>
                                                                    <button class="wechat-btn dropdown-item" value="1" val="1">微信</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="im-code" value="{$user->im_value}"
                                                            placeholder="联络方式账号">
                                                    </div>
                                                    <button class="btn btn-info" id="wechat-update"
                                                        type="button">修改</button>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-6 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-danger">
                                                <h4 class="card-title mb-0">重置订阅链接</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <button class="btn btn-info" id="reset-link"
                                                    type="button">重置订阅链接</button>
                                                <p>点击会重置您的订阅链接，您需要更新客户端中所配置的订阅地址方可继续使用。</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="buttons-input-group" id="input-group-buttons">
                            <div class="row match-height">
                                <div class="col-xl-6 col-lg-12 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title mb-0">节点连接密码修改</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <fieldset>
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text" id="sizing-addon3">当前连接密码</span>
                                                        </div>
                                                        <input type="text" class="form-control" value="{$user->passwd}" placeholder="连接密码" readonly>
                                                        <div class="input-group-append">
                                                            <button class="btn btn-info" id="ss-pwd-update"
                                                                type="button">重置</button>
                                                        </div>
                                                    </div>
                                                    <P>点击重置按钮将会自动生成由随机字母和数字组成的连接密码。</P>
                                                    <p>修改连接密码同时也会自动为您重新生成 V2Ray 和 Trojan 节点的 UUID。</p>
                                                    <p>修改连接密码后，您需要更新订阅或修改客户端配置方可继续使用。</p>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-12 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title mb-0">密码修改</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <fieldset>
                                                    <div class="input-group">
                                                        <input type="password" id="oldpwd" class="form-control"
                                                            placeholder="当前密码">
                                                    </div>
                                                    <div class="input-group">
                                                        <input type="password" id="pwd" class="form-control"
                                                            placeholder="新密码">
                                                    </div>
                                                    <div class="input-group">
                                                        <input type="password" id="repwd" class="form-control"
                                                            placeholder="确认新密码">
                                                    </div>
                                                    <button class="btn btn-info" id="pwd-update"
                                                        type="button">修改</button>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>

        </div>

        {include file='user/footer.tpl'}
        <script src="/theme/convex/app-assets/vendors/js/sweetalert2.min.js"></script>
        <script src="/theme/convex/app-assets/vendors/js/clipboard.min.js"></script>
        <script>
            var im_type = {$user->im_type};
            $('.wechat-btn').click(function(){
                if($(this).val()=="1"){
                    $('#im-type').val('微信');
                    im_type = 1;
                }
                if($(this).val()=="2"){
                    $('#im-type').val('QQ');
                    im_type = 2;
                }
                console.log('当前选择的值：' + $(this).val())

            })
        </script>
        <script>
            $(document).ready(function () {
                //密码修改
                $("#pwd-update").click(function () {
                    $.ajax({
                        type: "POST",
                        url: "password",
                        dataType: "json",
                        data: {
                            oldpwd: $('#oldpwd').val(),
                            pwd: $('#pwd').val(),
                            repwd: $('#repwd').val()
                        },
                        success: (data) => {
                            if (data.ret) {
                                swal("成功", data.msg, "success").then(function () {
                                   window.setTimeout("location.href='/user/logout'", {$config['jump_delay']});
                                }).done();
                            }else{
                                swal("错误", data.msg, "info").done();
                            }
                        },
                        error: (jqXHR) => {
                            swal("错误", data.msg, "error").done();
                        }
                    })
                })

                //用户名修改
                $("#username-update").click(function () {
                    $.ajax({
                        type: "POST",
                        url: "username",
                        dataType: "json",
                        data: {
                            newusername: $('#newusername').val()
                        },
                        success: (data) => {
                           swal("成功", data.msg, "success").done();
                        },
                        error: (jqXHR) => {
                           swal("错误", data.msg, "error").done();
                        }
                    })
                })
            })

            //联系方式修改
            $("#wechat-update").click(function () {
                $.ajax({
                    type: "POST",
                    url: "wechat",
                    dataType: "json",
                    data: {
                        wechat: $('#im-code').val(),
                        imtype:im_type
                    },
                    success: (data) => {
                        if (data.ret) {
                            swal("成功", data.msg, "success").done();
                        } else {
                           swal("失败", data.msg, "info").done();
                        }
                    },
                    error: (jqXHR) => {
                        swal("错误", data.msg, "error").done();
                    }
                })
            })

            //IP解封
            $("#unblock").click(function () {
                $.ajax({
                    type: "POST",
                    url: "unblock",
                    dataType: "json",
                    data: {},
                    success: (data) => {
                        if (data.ret) {
                            swal("成功", data.msg, "success").done();
                        } else {
                            swal("失败", data.msg, "info").done();
                        }
                    },
                    error: (jqXHR) => {
                        swal("错误", data.msg, "error").done();
                    }
                })
            })

            //重置连接密码
            $("#ss-pwd-update").click(function () {
                $.ajax({
                    type: "POST",
                    url: "sspwd",
                    dataType: "json",
                    data: {},
                    success: (data) => {
                        if (data.ret) {
                           swal("成功", '修改成功', "success").then(function () {
                                location.reload();
                            }).done();
                        } else {
                            swal("失败", '重置密码失败', "info").done();
                        }
                    },
                    error: (jqXHR) => {
                        swal("错误", data.msg, "error").done();
                    }
                })
            })

            //重置订阅链接
            $("#reset-link").click(function () {
                swal("成功", '已重置您的订阅链接，请变更或添加您的订阅链接！', "success").then(function () {
                     window.setTimeout("location.href='/user/url_reset'", {$config['jump_delay']});
                 }).done();
            });

        </script>
    </body>
</html>

{$pagename='theme'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
    <head>
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/sweetalert2.min.css">
    </head>
    <!--head结束区-->

    <body data-col="1-column" class=" 1-column  blank-page blank-page">
        <div class="wrapper">
            <!--Registration Page Starts-->
            <section id="regestration">
                <div class="container-fluid">
                    <div class="row full-height-vh">
                        <div class="col-12 d-flex align-items-center justify-content-center gradient-aqua-marine">
                            <div class="card px-4 py-2 box-shadow-2">
                                <div class="card-header text-center">
                                    <img src="/theme/convex/app-assets/img/logos/logo-color-big.png" alt="company-logo"
                                        class="mb-3" width="80">
                                    <h4 class="text-uppercase text-bold-400 grey darken-1">注册</h4>
                                </div>
                                {if $config['register_mode']!='close'}
                                <div class="card-body">
                                    <div class="card-block mx-auto">
                                        <form novalidate>
                                            <div class="form-group">
                                                <div class="col-md-12 controls">
                                                    <input type="text" class="form-control form-control-lg" name="name"
                                                        id="name" placeholder="昵称" required data-validation-required-message="用户名必须填">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 controls">
                                                    <input type="email" class="form-control form-control-lg"
                                                        name="email" id="email" inputmode="email"
                                                        autocomplete="username" placeholder="邮箱(唯一凭证请认真对待)"
                                                        required data-validation-required-message="邮箱必须填写">
                                                </div>
                                            </div>
                                            {if $enable_email_verify == true}
                                            <div class="form-group">
                                                <div class="col-md-12 controls">
                                                    <div class="input-group">
                                                        <input type="text" id="email_code"
                                                            class="form-control form-control-lg" placeholder="邮箱验证码"
                                                            required data-validation-required-message="请填写验证码">
                                                        <div class="input-group-append">
                                                            <button id="email_verify" class="btn btn-primary"
                                                                type="button">获取</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                            {if $config['enable_reg_im'] == true}
                                            <div class="form-group">
                                                <div class="col-md-12 controls">
                                                    <div class="input-group">
                                                        <div class="dropdown" placement="top-right">
                                                            <div class="input-group-prepend">
                                                                <button class="btn btn-info dropdown-toggle form-control-lg"
                                                                    data-toggle="dropdown"
                                                                    id="im_type" name="im_type" value="1">请选择</button>
                                                                <div class="dropdown-menu"  id="im_type"
                                                                    aria-labelledby="dropdownBasic12">
                                                                    <button type="button" class="im-type-btn dropdown-item" onclick="setImType(2)">QQ</button>
                                                                    <button type="button" class="im-type-btn dropdown-item" onclick="setImType(1)">微信</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <input type="text" id="im_value" name="im_value" placeholder="请输入社交账号" class="form-control form-control-lg"
                                                        required data-validation-required-message="请输入社交账号">
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}
                                            <div class="form-group">
                                                <div class="col-md-12 controls">
                                                    <input type="password" class="form-control form-control-lg"
                                                        name="passwd" id="passwd" placeholder="密码"
                                                        required data-validation-required-message="请输入密码">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 controls">
                                                    <input type="password" class="form-control form-control-lg"
                                                        name="repasswd" id="repasswd" placeholder="重复密码"
                                                        data-validation-match-match="passwd" required>
                                                </div>
                                            </div>
                                            {if $config['register_mode'] == 'invite'}
                                            <div class="form-group">
                                                <div class="col-md-12 controls">
                                                    <input type="text" class="form-control form-control-lg" name="code"
                                                        id="code" inputmode="text" autocomplete="username"
                                                        placeholder="邀请码（必填）"
                                                        required data-validation-required-message="请填写邀请码">
                                                </div>
                                            </div>
                                            {/if}
                                            <div class="form-group col-sm-offset-1">
                                                <div class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0">
                                                    <input type="checkbox" class="custom-control-input" checked
                                                        id="terms">
                                                    <label class="custom-control-label pl-2"
                                                        for="terms">我同意隐私协议</a></label>
                                                </div>
                                            </div>
                                            <div class="form-group text-center">
                                                <button type="submit" id="register" onsubmit="register();"
                                                    class="btn btn-danger px-4 py-2 text-uppercase white font-small-4 box-shadow-2 border-0">注册</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                {else}
                                <h5>本站已停止新用户注册，请联系管理员。谢谢</h5>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--Registration Page Ends-->
        </div>

        {include file='user/footer.tpl'}
        <script src="/theme/convex/app-assets/vendors/js/jqBootstrapValidation.js"></script>
        <script src="/theme/convex/app-assets/vendors/js/sweetalert2.min.js"></script>
        <script>
            $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
            function setImType(value){
                $('#im_type').attr('value',value)
                if(value=='1'){
                    $('#im_type').html('微信');
                }
                if(value=='2'){
                    $('#im_type').html('QQ');
                }
                return false;
            }

        </script>

        {if $config['register_mode']!='close'}
            <script>
                $(document).ready(function () {
                    function register() {
                        {if $config['register_mode'] == 'invite'}
                        code = $('code').val();
                        {else}
                        code = 0;
                        if ((getCookie('code')) != '') {
                            code = getCookie('code');
                        }
                        {/if}
                        //document.getElementById("tos").disabled = true;

                        $.ajax({
                            type: "POST",
                            url: location.pathname,
                            dataType: "json",
                            data: {
                                {if $config['enable_reg_captcha'] == true && $config['captcha_provider'] == 'recaptcha'}
                                recaptcha: grecaptcha.getResponse(),
                                {/if}
                                {if $geetest_html != null}
                                geetest_challenge: validate.geetest_challenge,
                                geetest_validate: validate.geetest_validate,
                                geetest_seccode: validate.geetest_seccode,
                                {/if}
                                {if $config['enable_reg_im'] == true}
                                im_value: $('#im_value').val(),
                                im_type: $('#im_type').val(),
                                {/if}
                                {if $enable_email_verify == true}
                                emailcode: $('#email_code').val(),
                                {/if}
                                code,
                                name: $('#name').val(),
                                email: $('#email').val(),
                                passwd: $('#passwd').val(),
                                repasswd: $('#repasswd').val()
                            },
                            success: (data) => {
                                if (data.ret == 1) {
                                    swal("注册成功", data.msg, "success").then(function () {
                                        window.setTimeout("location.href='/user'", {$config['jump_delay']});
                                    }).done();
                                } else {
                                    swal("注册失败", data.msg, "info").done();
                                    setCookie('code', '', 0);
                                    $("#code").val(getCookie('code'));
                                    {if $geetest_html != null}
                                    captcha.refresh();
                                    {/if}
                                }
                            },
                            error: (jqXHR) => {
                                swal("系统错误", data.msg, "error").done();
                                {if $geetest_html != null}
                                captcha.refresh();
                                {/if}
                            }
                        });
                        return false;
                    }


                    $("#register").click(function(){
                        event.preventDefault();
                        register();
                    })

                })
            </script>
        {/if}

        {if $enable_email_verify == true}
            <script>
                var wait = 60;

                function time(o) {
                    if (wait == 0) {
                        o.removeAttr("disabled");
                        o.text("获取");
                        wait = 60;
                    } else {
                        o.attr("disabled", "disabled");
                        o.text("重新发送(" + wait + ")");
                        wait--;
                        setTimeout(function () {
                                    time(o)
                                },
                                1000)
                    }
                }

                $(document).ready(function () {
                    $("#email_verify").click(function () {
                        time($("#email_verify"));

                        $.ajax({
                            type: "POST",
                            url: "send",
                            dataType: "json",
                            data: {
                                email: $$getValue('email')
                            },
                            success: (data) => {
                                if (data.ret) {
                                    swal("发送成功", data.msg, "success").done();

                                } else {
                                    swal("发送失败", data.msg, "info").done();

                                }
                            },
                            error: (jqXHR) => {
                               swal("系统错误", data.msg, "error").done();
                            }
                        })
                    })
                })
            </script>
        {/if}

        {*dumplin:aff链*}
        <script>
            {*dumplin：轮子1.js读取url参数*}
            function getQueryVariable(variable) {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i = 0; i < vars.length; i++) {
                    var pair = vars[i].split("=");
                    if (pair[0] == variable) {
                        return pair[1];
                    }
                }
                return "";
            }

            {*dumplin:轮子2.js写入cookie*}
            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toGMTString();
                document.cookie = cname + "=" + cvalue + "; " + expires;
            }

            {*dumplin:轮子3.js读取cookie*}
            function getCookie(cname) {
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i].trim();
                    if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
                }
                return "";
            }

            {*dumplin:读取url参数写入cookie，自动跳转隐藏url邀请码*}
            if (getQueryVariable('code') != '') {
                setCookie('code', getQueryVariable('code'), 30);
                window.location.href = '/auth/register';
            }

            {if $config['register_mode'] == 'invite'}
            {*dumplin:读取cookie，自动填入邀请码框*}
            if ((getCookie('code')) != '') {
                $("#code").val(getCookie('code'));
            }
            {/if}
        </script>

    </body>
</html>

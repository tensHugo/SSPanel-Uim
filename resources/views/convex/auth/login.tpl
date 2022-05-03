{$pagename='theme'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
    <head>
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/sweetalert2.min.css">
    </head>
    <!--head结束区-->

<body  data-col="1-column" class=" 1-column  blank-page blank-page">
    <div class="wrapper"><!--Login Page Starts-->
    <section id="login">
        <div class="container-fluid">
            <div class="row full-height-vh">
                <div class="col-12 d-flex align-items-center justify-content-center gradient-aqua-marine">
                    <div class="card px-4 py-2 box-shadow-2 width-400">
                        <div class="card-header text-center">
                            <img src="/theme/convex/app-assets/img/logos/logo-color-big.png" alt="company-logo" class="mb-3" width="80">
                            <h4 class="text-uppercase text-bold-400 grey darken-1">登录</h4>
                        </div>
                        <div class="card-body">
                            <div class="card-block">
                                <form>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <input type="email" class="form-control form-control-lg" id="email" placeholder="邮箱" required email>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <input type="password" class="form-control form-control-lg" id="passwd" placeholder="密码" required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="custom-control custom-checkbox mb-2 mr-sm-2 mb-sm-0 ml-5">
                                                    <input type="checkbox" class="custom-control-input" checked id="rememberme">
                                                    <label class="custom-control-label float-left" id="remember_me" name="remember_me" for="rememberme">记住我</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="text-center col-md-12">
                                            <button type="button" id="login_btn" class="btn btn-danger px-4 py-2 text-uppercase white font-small-4 box-shadow-2 border-0">登录</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="text-center mb-2 mr-sm-2 mb-sm-0">
                                   阅读<a target="_blank" href="/useragr">《用户协议》</a>和 <a target="_blank" href="/privacy">《隐私政策》</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer grey darken-1">
                            <div class="text-center mb-1">忘记密码? <a onclick="alert('找回密码功能即将开放');"><b>点此找回</b></a></div>
                            <div class="text-center">还没有账号? <a href="/auth/register"><b>点此注册</b></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Login Page Ends-->
        </div>
    {include file='user/footer.tpl'}
    <script src="/theme/convex/app-assets/vendors/js/sweetalert2.min.js"></script>
    <script>
        $(document).ready(function () {
            function login() {
                {if $geetest_html != null}
                if (typeof validate === 'undefined' || !validate) {
                    $("#result").modal();
                    $$.getElementById('msg').innerHTML = '请滑动验证码来完成验证';
                    return;
                }
                {/if}

                document.getElementById("login").disabled = true;

                $.ajax({
                    type: "POST",
                    url: location.pathname,
                    dataType: "json",
                    data: {
                        {if $config['enable_login_captcha'] == true && $config['captcha_provider'] == 'recaptcha'}
                        recaptcha: grecaptcha.getResponse(),
                        {/if}
                        {if $geetest_html != null}
                        geetest_challenge: validate.geetest_challenge,
                        geetest_validate: validate.geetest_validate,
                        geetest_seccode: validate.geetest_seccode,
                        {/if}
                        code: '',
                        email: $('#email').val(),
                        passwd: $('#passwd').val(),
                        remember_me: $("#remember_me:checked").val()
                    },
                    success: (data) => {
                        if (data.ret == 1) {
                            window.setTimeout("location.href='/user'", {$config['jump_delay']});
                        } else {
                            swal("登录失败", data.msg, "info").done();
                            document.getElementById("login").disabled = false;
                            {if $geetest_html != null}
                            captcha.refresh();
                            {/if}
                        }
                    },
                    error: (jqXHR) => {
                        swal("系统错误", data.msg, "info").done();
                        document.getElementById("login").disabled = false;
                        {if $geetest_html != null}
                        captcha.refresh();
                        {/if}
                    }
                });
            }

            $("#login_btn").click(function () {
                login();
            });
        })
    </script>
</body>
</html>

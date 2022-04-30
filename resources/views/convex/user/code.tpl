{$pagename='code'}
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
                    <section id="blockquotes">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="content-header">充值中心</div>
                                <p class="content-sub-header">您可以在这里选用充值方式充值您的余额</p>
                            </div>
                        </div>
                        <div class="row match-height">
                            <div class="col-md-12 col-lg-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title-wrap bar-primary">
                                            <h4 class="card-title"><i class="icon-wallet"></i>我的钱包</h4>
                                        </div>
                                        <p>充值完成后需刷新网页以查看余额，通常一分钟内到账。因余额不足而未能完成的自动续费，在余额足够时会自动划扣续费。</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-block">
                                            <div class="card-text">
                                                <div class="row">
                                                    <div class="col-md-12 col-lg-12 text-center">
                                                        <p class="text-warning font-large-3 text-bold-700">￥{$user->money}</p>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title-wrap bar-success">
                                            <h4 class="card-title">充值码充值</h4>
                                        </div>
                                        <p>利用获得的充值码输入下面的输入框中充值</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-block">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">充值码</span>
                                                </div>
                                                <input type="text" class="form-control" placeholder="请将充值码粘贴至此处"
                                                    aria-label="充值码" id="pay-code" value=""
                                                    aria-describedby="basic-addon1">
                                            </div>
                                            <div class="text-right">
                                                <button class="btn mr-1 shadow-z-2 btn-info" id="code-update">
                                                   充值
                                                </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="striped-inverse">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title-wrap bar-success">
                                            <h4 class="card-title">使用记录</h4>
                                        </div>
                                        <p>这里是充值或者金额使用记录</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-block">
                                            <table class="table table-striped table-inverse">
                                                <thead>
                                                    <tr>
                                                        <th>充值码</th>
                                                        <th>类型</th>
                                                        <th>操作</th>
                                                        <th>使用时间</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                {foreach $codes as $code}
                                                    {if $code->type!=-2}
                                                        <tr>
                                                            <!--	<td>#{$code->id}</td>  -->
                                                            <td>{$code->code}</td>
                                                            {if $code->type==-1}
                                                                <td>金额充值</td>
                                                            {/if}
                                                            {if $code->type==10001}
                                                                <td>流量充值</td>
                                                            {/if}
                                                            {if $code->type==10002}
                                                                <td>用户续期</td>
                                                            {/if}
                                                            {if $code->type>=1&&$code->type<=10000}
                                                                <td>等级续期 - 等级{$code->type}</td>
                                                            {/if}
                                                            {if $code->type==-1}
                                                                <td>充值 {$code->number} 元</td>
                                                            {/if}
                                                            {if $code->type==10001}
                                                                <td>充值 {$code->number} GB 流量</td>
                                                            {/if}
                                                            {if $code->type==10002}
                                                                <td>延长账户有效期 {$code->number} 天</td>
                                                            {/if}
                                                            {if $code->type>=1&&$code->type<=10000}
                                                                <td>延长等级有效期 {$code->number} 天</td>
                                                            {/if}
                                                            <td>{$code->usedatetime}</td>
                                                        </tr>
                                                    {/if}
                                                {/foreach}
                                                </tbody>
                                            </table>
                                            {$render}
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
    <script>
        $(document).ready(function () {
                $("#code-update").click(function () {
                    $.ajax({
                        type: "POST",
                        url: "code",
                        dataType: "json",
                        data: {
                            code: $("#pay-code").val()
                        },
                        success: (data) => {
                            if (data.ret) {
                                swal("成功", data.msg , "success").done();
                                window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                            } else {
                                swal("失败", data.msg , "error").done();
                                window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                            }
                        },
                        error: (jqXHR) => {
        {literal}
                            swal("系统错误", '系统发生错误' , "error").done();
        {/literal}
                        }
                    })
                })
            })
    </script>
</body>
</html>

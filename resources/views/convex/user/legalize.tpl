{$pagename='legalize'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
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
                        <div class="row justify-content-md-center">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title-wrap bar-danger">
                                            <h4 class="card-title" id="horz-layout-card-center">实名认证中心</h4>
                                        </div>
                                        <p class="mb-0 text-info">1.根据工信部发布的《计算机信息网络国际联网安全保护管理办法》对于提供国际联网的单位或企业需要对用户实行严格的登记备案制度。</p>
                                        <p class="mb-0 text-info"">2.我们使用的是“公安一所CTID”实人认证系统，全程公安系统自动审核。最快在5分钟内认证完毕。</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="px-3">
                                            <form class="form form-horizontal">
                                                <div class="form-body center">
                                                    <div class="form-actions center">
                                                        {if $user->is_legalize==0 && $config['is_legalize']==1}
                                                        <p>请使用微信扫描以下二维码按照提示完成认证！</p>
                                                        <a href="{$verifyurl}" class="btn btn-info">手机用户直接点此按钮认证</a>
                                                        <div id="ga-qr" class="center"></div>
                                                        {/if}
                                                        {if $user->is_legalize==1 && $config['is_legalize']==1}
                                                        <i class="ft ft-check-circle text-success font-large-3"></i>
                                                        <p>恭喜您，<code class="text-info font-large-1">{$user->legname}</code>！已完成实名认证。您现在可以正常使用了</p>
                                                        {/if}
                                                        {if $config['is_legalize']==0}
                                                        <i class="ft ft-alert-triangle text-info font-large-3"></i>
                                                        <p>很抱歉，管理员暂时未开启实名认证功能！</p>
                                                        {/if}
                                                    </div>
                                                </div>
                                                {if $user->is_legalize==0 && $config['is_legalize']==1}
                                                <div class="form-actions center">
                                                    <button type="button" id="check" class="btn btn-success">
                                                        <i class="icon-check"></i>我已经认证完了
                                                    </button>
                                                </div>
                                                {/if}
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        {include file='user/footer.tpl'}
        <script src="https://cdn.jsdelivr.net/gh/davidshimjs/qrcodejs@master/qrcode.min.js"></script>
        <script>
            {if $user->is_legalize==0 && $config['is_legalize']==1}
            var ga_qrcode = '{$verifyurl}',
            qrcode1 = new QRCode(document.getElementById("ga-qr"));

            qrcode1.clear();
            qrcode1.makeCode(ga_qrcode);
            {/if}
            
            $('#check').click(function(){
                location.reload();
            })
            
        </script>
    </body>
</html>

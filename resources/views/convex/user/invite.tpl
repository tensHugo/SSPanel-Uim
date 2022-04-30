{$pagename='invite'}
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
                        <section id="description-list-alignment">
                            <div class="row">
                                <div class="col-sm-12 col-md-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title">邀请有奖</h4>
                                            </div>
                                            <p>通过邀请用户注册，您将会获得奖励</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <div class="card-text">
                                                    <ul>
                                                       <li>每邀请一位用户注册，您都会获得 <code>{$config['invite_gift']}G</code> 流量奖励；对方会获得 <code>{$config['invite_get_money']}</code> 元余额奖励</li>
                                                       <li>对方在进行账户充值或购买套餐后，您可获得订单金额的 <code>{$config['code_payback'] * 100} %</code> 作为返利</li>
                                                       <li>具体邀请返利规则请查看公告，或通过工单系统询问管理员</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title">邀请链接</h4>
                                            </div>
                                            <p>通过下方邀请链接注册，您可获得奖励</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <P><code>剩余邀请次数：10次</code></p>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">链接</span>
                                                    </div>
                                                    <input type="text" class="form-control" placeholder="link"
                                                        aria-label="link" id="link" value="{$config['baseUrl']}/auth/register?code={$code->code}"
                                                        aria-describedby="basic-addon1" readonly="readonly">
                                                </div>
                                                <div class="text-right">
                                                    <button class="btn mr-1 shadow-z-2 btn-info" data-clipboard-text="{$config['baseUrl']}/auth/register?code={$code->code}">
                                                       复制链接
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
                                                <h4 class="card-title">邀请记录</h4>
                                            </div>
                                            <p>这里是邀请和返利的记录</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <p>您通过邀请好友获得的总返利为：<code>{$paybacks_sum}</code> 元</p>
                                                <table class="table table-striped table-inverse">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>邀请用户昵称</th>
                                                            <th>返利金额</th>
                                                            <th>返利时间</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    {foreach $paybacks as $payback}
                                                        <tr>
                                                           <td>{$payback->id}</td>
                                                           {if $payback->user()!=null}
                                                               <td>{$payback->user()->user_name}</td>
                                                           {else}
                                                               <td>已注销</td>
                                                           {/if}
                                                           <td>{$payback->ref_get} 元</td>
                                                           <td>{date('Y-m-d H:i:s', $payback->datetime)}</td>
                                                        </tr>
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
        <script src="/theme/convex/app-assets/vendors/js/clipboard.min.js"></script>
        <script>
            const btnCopy = new ClipboardJS('.btn');
            $('.btn').click(function(){
                swal("复制成功", '您可以到任意地方去粘贴！', "success").done();
            })
        </script>
    </body>
</html>

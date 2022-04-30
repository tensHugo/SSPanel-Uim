{$pagename='shop'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
    <head>
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/sweetalert2.min.css">
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/switchery.min.css">
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
                        <section id="tabs-with-icons">
                            <div class="row match-height">
                                <div class="col-xl-12 col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-primary">
                                                <h4 class="card-title">商品列表</h4>
                                                <p>商品不可叠加，新购商品会覆盖旧商品的效果。购买新套餐时，如果未关闭旧套餐自动续费，则旧套餐的自动续费依然生效。</p>
                                                <p>当前账户余额：<code class="font-large-1">{$user->money}</code>元</p>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <ul class="nav nav-tabs">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="baseIcon-tab1" data-toggle="tab"
                                                            aria-controls="tabIcon1" href="#tabIcon1"
                                                            aria-expanded="true"><i class="fa ft-package"></i>套餐购买</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" id="baseIcon-tab2" data-toggle="tab"
                                                            aria-controls="tabIcon2" href="#tabIcon2"
                                                            aria-expanded="false"><i class="fa ft-wifi"></i>流量包购买</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content px-1 pt-1">
                                                    <div role="tabpanel" class="tab-pane active" id="tabIcon1"
                                                        aria-expanded="true" aria-labelledby="baseIcon-tab1">
                                                        <section id="text-alignment">
                                                            <div class="row">
                                                                {foreach $shops as $shop}
                                                                {if $shop->traffic_package() == 0}
                                                                <div class="col-lg-4 col-md-12">
                                                                    <div class="card text-center"
                                                                        style="background-color: #F5F5F5;">
                                                                        <div class="card-header">
                                                                            <h4 class="card-title info">{$shop->name}
                                                                            </h4>
                                                                            <p
                                                                                class="font-large-1 text-danger text-bold-700">
                                                                                ￥{$shop->price}</p>
                                                                            <p>{$shop->bandwidth()}GB/{$shop->class_expire()}天
                                                                            </p>
                                                                        </div>
                                                                        <div class="row text-warning">
                                                                            <div class="col-lg-4 col-md-12">
                                                                                <div class="text-center">
                                                                                    <h5 class="">
                                                                                        LV.{$shop->user_class()}</h5>
                                                                                    <p class="font-small-2">
                                                                                        VIP{$shop->user_class()}</p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-12">
                                                                                <div class="text-center">
                                                                                    <h5 class="">{if
                                                                                        {$shop->connector()} == '0'
                                                                                        }无限制{else}{$shop->connector()}个{/if}
                                                                                    </h5>
                                                                                    <p class="font-small-2">客户端数量</p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-lg-4 col-md-12">
                                                                                <div class="text-center">
                                                                                    <h5 class="">{if
                                                                                        {$shop->speedlimit()} == '0'
                                                                                        }无限制{else}{$shop->speedlimit()}Mbps{/if}
                                                                                    </h5>
                                                                                    <p class="font-small-2">端口速率</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="card-body">
                                                                            <div class="card-block">
                                                                                {foreach $shop->content_extra() as
                                                                                $service}
                                                                                <p><i
                                                                                        class="fa fa-{$service[0]}"></i>{$service[1]}
                                                                                </p>
                                                                                {/foreach}
                                                                                <a class="btn btn-success"
                                                                                    onClick="buy('{$shop->id}',{$shop->auto_renew})"
                                                                                    id="add-buy">立即购买</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                {/if}
                                                                {/foreach}
                                                            </div>
                                                        </section>
                                                    </div>
                                                    <div class="tab-pane" id="tabIcon2" aria-labelledby="baseIcon-tab2">
                                                        <section id="minimal-statistics-bg">
                                                            <div class="row match-height">
                                                                {foreach $shops as $shop}
                                                                {if $shop->traffic_package() != 0}
                                                                <div class="col-xl-3 col-lg-6 col-12">
                                                                    <a>
                                                                    <div class="card bg-info" onClick="buyTraffic('{$shop->id}','{$shop->name}')">
                                                                        <div class="card-body">
                                                                            <div class="px-3 py-3">
                                                                                <div class="row text-white">
                                                                                    <div class="col-6">
                                                                                        <h1><i
                                                                                                class="fa fa-rocket background-round text-white p-2 font-medium-3"></i>
                                                                                        </h1>
                                                                                        <h4 class="pt-1 m-0 text-white">
                                                                                            {$shop->bandwidth()}GB</h4>
                                                                                    </div>
                                                                                    <div class="col-6 text-right pl-0">
                                                                                        <h4 class="text-white">
                                                                                            ￥{$shop->price}</h4>
                                                                                        <br>
                                                                                        <span>{$shop->name}</span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    </a>
                                                                </div>
                                                                {/if}
                                                                {/foreach}
                                                            </div>
                                                        </section>
                                                    </div>
                                                </div>
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
        <script src="/theme/convex/app-assets/vendors/js/switchery.min.js"></script>
        <script src="/theme/convex/app-assets/js/switch.min.js"></script>
        <script>
            function buy(id, auto) {
                shop = id;
                swal({
                    title: '您可以在下方输入优惠码，如果没有优惠码直接点确认',
                    input: 'text',
                    showCancelButton: true,
                    confirmButtonText: '确认',
                    cancelButtonText: '取消',
                    showLoaderOnConfirm: true,
                    preConfirm: function() {
                        return new Promise(function(resolve) {
                            setTimeout(function() {
                                resolve();
                            }, 2000);
                        });
                    },
                    allowOutsideClick: false
                }).then(function(text) {
                    var coupon = text;
                    $.ajax({
                        type: "POST",
                        url: "coupon_check",
                        dataType: "json",
                        data: {
                            coupon,
                            shop
                        },
                        success: (data) => {
                            if (data.ret) {
                                swal({
                                    title: '请确认订单信息',
                                    type: 'info',
                                    html: '<p>商品名称：' + data.name + '</p>' +
                                        '<p>优惠额度：' + data.credit + '</p>' +
                                        '<p>总金额：<code class="font-large-1">' + data.total +
                                        '</code></p>' +
                                        '<div class="form-group mt-1">' +
                                        '<input type="checkbox" id="autorenew" class="switchery" data-size="sm" checked/>' +
                                        '<label for="switcherySize2">关闭旧套餐自动续费</label></div>',
                                    showCloseButton: true,
                                    showCancelButton: true,
                                    confirmButtonText: '确认',
                                    cancelButtonText: '取消'
                                }).then(function() {
                                    if (document.getElementById('autorenew').checked) {
                                        var autorenew = 1;
                                    } else {
                                        var autorenew = 0;
                                    }
                                    $.ajax({
                                        type: "POST",
                                        url: "buy",
                                        dataType: "json",
                                        data: {
                                            coupon,
                                            shop,
                                            autorenew
                                        },
                                        success: (data) => {
                                            if (data.ret) {
                                                swal("成功", data.msg, "success")
                                                    .then(function() {
                                                        window.setTimeout("location.href='/user/shop'", {$config['jump_delay']});
                                                    }).done();
                                            } else {
                                                swal("错误", data.msg, "error").done();
                                            }
                                        },
                                        error: (jqXHR) => {
                                            swal("系统错误", data.msg, "error")
                                                .done();
                                        }
                                    })
                                }).done();
                            } else {
                                swal("错误", data.msg, "error").done();
                            }
                        },
                        error: (jqXHR) => {
                            swal("系统错误", data.msg, "error").done();
                        }
                    })
                }).done();
            }
            function buyTraffic(id,name) {
                var trafficPackageId = id
                var shopName = name;
                swal("提示","您确定要购买'" + shopName + "'流量包吗？", "info")
                    .then(function() {
                        $.ajax({
                            type: "POST",
                            url: "buy_traffic_package",
                            dataType: "json",
                            data: {
                                shop: trafficPackageId
                            },
                            success: (data) => {
                                if (data.ret) {
                                    swal("成功", data.msg, "success")
                                        .then(function() {
                                            window.setTimeout("location.href='/user/shop'", {$config['jump_delay']});
                                        }).done();
                                } else {
                                    swal("错误", data.msg, "error").done();
                                }
                            },
                            error: (jqXHR) => {
                               swal("系统错误", data.msg, "error").done();
                            }
                        })
                    }).done();
            }
        </script>
    </body>
</html>

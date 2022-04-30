{$pagename='bought'}
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
                    <section id="striped-inverse">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title-wrap bar-success">
                                            <h4 class="card-title">购买记录</h4>
                                        </div>
                                        <p>您可在此查询您账户的购买记录。</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-block">
                                            <table class="table table-striped table-inverse">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>购买时间</th>
                                                        <th>商品名称</th>
                                                        <th>内容</th>
                                                        <th>价格</th>
                                                        <th>续费时间</th>
                                                        <th>续费时重置流量</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                {foreach $shops as $shop}
                                                    <tr>
                                                        <td>#{$shop->id}</td>
                                                        <td>{$shop->datetime()}</td>
                                                        <td>{$shop->shop()->name}</td>
                                                        <td>{$shop->shop()->content()}</td>
                                                        <td>{$shop->price} 元</td>
                                                        <td>{$shop->renew()}</td>
                                                        <td>{$shop->auto_reset_bandwidth()}</td>
                                                        <td>
                                                            <button type="button" class="btn btn-sm btn-outline-danger round" {if $shop->renew==0}disabled{else}href="javascript:void(0);" onClick="delete_modal_show('{$shop->id}')"{/if}>关闭自动续费</button>
                                                        </td>
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
    <script>
        function delete_modal_show(id) {
           swal({
               title: '您确定要关闭自动续费吗？',
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
           }).then(function() {
               $.ajax({
                   type: "DELETE",
                   url: "/user/bought",
                   dataType: "json",
                   data: {
                       id
                   },
                   success: (data) => {
                       if (data.ret) {
                           swal("成功", data.msg, "success")
                               .then(function() {
                                   window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
                               }).done();
                       } else {
                          swal("错误", data.msg, "error").done();
                       }
                   },
                   error: (jqXHR) => {
                      swal("系统错误", data.msg, "error").done();
                   }
               });
           })
        }
    </script>
</body>
</html>

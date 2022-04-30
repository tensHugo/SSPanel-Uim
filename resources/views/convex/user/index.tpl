{$pagename='index'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    <head>
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/chartist.min.css">
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/sweetalert2.min.css">
    </head>
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
                        <div class="container-fluid">
                            {if $user->is_legalize==0 && $config['is_legalize']==1}
                            <div class="alert alert-warning">
                                <strong>注意！</strong>您还未完成实名认证，暂时无法正常使用。<a href="/user/legalize">点此前往认证</a>
                            </div>
                            {/if}
                            <section id="minimal-statistics-bg">
                                <div class="row match-height">
                                    <div class="col-xl-3 col-lg-6 col-12">
                                        <div class="card bg-success">
                                            <div class="card-body">
                                                <div class="px-3 py-3">
                                                    <div class="row text-white">
                                                        <div class="col-6">
                                                            <h1><i
                                                                    class="fa fa-star-o background-round text-white p-2 font-medium-3"></i>
                                                            </h1>
                                                        </div>
                                                        <div class="col-6 text-right pl-0">
                                                            <h4 class="text-white mb-2">账户等级</h4>
                                                            {if $user->class!=0}
                                                            <dd>VIP {$user->class}</dd>
                                                            {else}
                                                            <span>试用账号</span>
                                                            {/if}
                                                            <br>
                                                            {if $user->class_expire!="1989-06-04 00:05:00"}
                                                            <span>{$user->class_expire}到期</span>
                                                            {else}
                                                            <span>永不过期</span>
                                                            {/if}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-6 col-12">
                                        <div class="card bg-danger">
                                            <div class="card-body">
                                                <div class="px-3 py-3">
                                                    <div class="row text-white">
                                                        <div class="col-6">
                                                            <h1><i
                                                                    class="fa fa-usd background-round text-white p-2 font-medium-3"></i>
                                                            </h1>
                                                        </div>
                                                        <div class="col-6 text-right pl-0">
                                                            <h4 class="text-white mb-2">账户余额</h4>
                                                            <span>{$user->money} CNY</span>
                                                            <br>
                                                            <span>商店充值</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-6 col-12">
                                        <div class="card bg-info">
                                            <div class="card-body">
                                                <div class="px-3 py-3">
                                                    <div class="row text-white">
                                                        <div class="col-6">
                                                            <h1><i
                                                                    class="fa ft-command background-round text-white p-2 font-medium-3"></i>
                                                            </h1>
                                                            <h4 class="pt-1 m-0 text-white">
                                                                {$user->online_ip_count()}台在线</h4>
                                                        </div>
                                                        <div class="col-6 text-right pl-0">
                                                            <h4 class="text-white mb-2">在线设备</h4>
                                                            <span>设备限制数</span>
                                                            <br>
                                                            {if $user->node_connector!=0}
                                                            <span>{$user->node_connector}台</span>
                                                            {else}
                                                            <span>不限制</span>
                                                            {/if}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-6 col-12">
                                        <div class="card bg-warning">
                                            <div class="card-body">
                                                <div class="px-3 py-3">
                                                    <div class="row text-white">
                                                        <div class="col-6">
                                                            <h1><i
                                                                    class="fa fa-rocket background-round text-white p-2 font-medium-3"></i>
                                                            </h1>
                                                        </div>
                                                        <div class="col-6 text-right pl-0">
                                                            <h4 class="text-white">端口速率</h4>
                                                            <span>最高下行</span>
                                                            <br>
                                                            {if $user->node_speedlimit!=0}
                                                            <span>{$user->node_speedlimit} Mbps</span>
                                                            {else}
                                                            <span>无限制</span>
                                                            {/if}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section id="description-list-alignment">
                                <div class="row match-height">
                                    <!-- Description lists horizontal -->
                                    <div class="col-md-12 col-lg-4">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title-wrap bar-warning">
                                                    <h4 class="card-title">快速使用配置 <small
                                                            class="text-muted">根据页面提示快速配置</small>
                                                    </h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="card-block">
                                                    <ul class="nav nav-tabs">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" id="base-tabX1" data-toggle="tab"
                                                                aria-controls="tab1" href="#tab1"
                                                                aria-expanded="true"><i
                                                                    class="fa fa-play"></i>Windows</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="base-tabX2" data-toggle="tab"
                                                                aria-controls="tab2" href="#tab2"
                                                                aria-expanded="false">MacOs</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="base-tabX3" data-toggle="tab"
                                                                aria-controls="tab3" href="#tab3"
                                                                aria-expanded="false">Android</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="base-tabX3" data-toggle="tab"
                                                                aria-controls="tab3" href="#tab4"
                                                                aria-expanded="false">IOS</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" id="base-tabX3" data-toggle="tab"
                                                                aria-controls="tab3" href="#tab5"
                                                                aria-expanded="false">路由器</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content px-1 pt-1">
                                                        <div role="tabpanel" class="tab-pane active" id="tab1"
                                                            aria-expanded="true" aria-labelledby="base-tabX1">
                                                            <p>
                                                                <div class="btn-group">
                                                                    <button class="btn btn-primary dropdown-toggle mr-1" id="dropdownRaised2" data-toggle="dropdown"><i class="fa fa-download"></i>客户端下载</button>
                                                                    <div class="dropdown-menu" aria-labelledby="dropdownRaised2">
                                                                        <a class="dropdown-item">Clash客户端（推荐）</a>
                                                                        <a class="dropdown-item">SSR客户端</a>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-group">
                                                                    <button class="btn btn-info dropdown-toggle mr-1" id="dropdownRaised2" data-toggle="dropdown"><i class="ft ft-navigation"></i>一键配置</button>
                                                                    <div class="dropdown-menu" aria-labelledby="dropdownRaised2">
                                                                        <a class="dropdown-item" href="clash://install-config?url={urlencode($subInfo['clash'])}">Clash一键配置</a>
                                                                        <a class="dropdown-item" data-clipboard-text="{$subInfo['ssr']}">SSR一键配置</a>
                                                                    </div>
                                                                </div>
                                                            </p>
                                                            <p class="text-info">先下载并安装客户端，客户端安装完成后再点击一键配置</p>
                                                        </div>
                                                        <div class="tab-pane" id="tab2" aria-labelledby="base-tabX2">
                                                           <p>
                                                               <div class="btn-group">
                                                                   <button class="btn btn-primary dropdown-toggle mr-1" id="dropdownRaised2" data-toggle="dropdown"><i class="fa fa-download"></i>客户端下载</button>
                                                                   <div class="dropdown-menu" aria-labelledby="dropdownRaised2">
                                                                       <a class="dropdown-item">ClashX客户端（推荐）</a>
                                                                       <a class="dropdown-item">ShadowsocksX-NG-R</a>
                                                                   </div>
                                                               </div>
                                                               <div class="btn-group">
                                                                   <button class="btn btn-info dropdown-toggle mr-1" id="dropdownRaised2" data-toggle="dropdown"><i class="ft ft-navigation"></i>一键配置</button>
                                                                   <div class="dropdown-menu" aria-labelledby="dropdownRaised2">
                                                                       <a class="dropdown-item" href="clash://install-config?url={urlencode($subInfo['clash'])}">ClashX一键配置</a>
                                                                       <a class="dropdown-item" data-clipboard-text="{$subInfo['ssr']}">SSR订阅复制</a>
                                                                   </div>
                                                               </div>
                                                           </p>
                                                           <p class="text-info">先下载并安装客户端，客户端安装完成后再点击一键配置。ShadowsocksX-NG-R通过复制订阅后到客户端手动配置。</p>
                                                        </div>
                                                        <div class="tab-pane" id="tab3" aria-labelledby="base-tabX3">
                                                            <p>
                                                                <div class="btn-group">
                                                                    <button class="btn btn-primary dropdown-toggle mr-1" id="dropdownRaised2" data-toggle="dropdown"><i class="fa fa-download"></i>客户端下载</button>
                                                                    <div class="dropdown-menu" aria-labelledby="dropdownRaised2">
                                                                        <a class="dropdown-item">ShadowsocksR（推荐）</a>
                                                                        <a class="dropdown-item">Clash For Android</a>
                                                                    </div>
                                                                </div>
                                                                <div class="btn-group">
                                                                    <button class="btn btn-info dropdown-toggle mr-1" id="dropdownRaised2" data-toggle="dropdown"><i class="ft ft-navigation"></i>一键配置</button>
                                                                    <div class="dropdown-menu" aria-labelledby="dropdownRaised2">
                                                                        <a class="dropdown-item" href="clash://install-config?url={urlencode($subInfo['clash'])}">ShadowsocksR一键配置</a>
                                                                        <a class="dropdown-item" href="clash://install-config?url={urlencode($subInfo['clash'])}">Clash一键配置</a>
                                                                    </div>
                                                                </div>
                                                            </p>
                                                            <p class="text-info">先下载并安装客户端，客户端安装完成后再点击一键配置。</p>
                                                        </div>
                                                        <div class="tab-pane" id="tab4" aria-labelledby="base-tabX4">
                                                            <p>
                                                                <div class="btn-group">
                                                                    <button class="btn btn-primary dropdown-toggle mr-1" id="dropdownRaised2" data-toggle="dropdown"><i class="fa fa-download"></i>客户端下载</button>
                                                                    <div class="dropdown-menu" aria-labelledby="dropdownRaised2">
                                                                        <a class="dropdown-item">Shadowrocket</a>
                                                                        <a class="dropdown-item">Quantumult</a>
                                                                    </div>
                                                                </div>
                                                               <a onclick=AddSub("{$subInfo['shadowrocket']}","shadowrocket://add/sub://") class="btn mr-1 shadow-z-2 btn-info"><i class="ft ft-navigation"></i>一键配置</a>
                                                            </p>
                                                            <p class="text-info">在安装 Shadowrocket 或 Quantumult 后，只需 使用 Safari 浏览器 点击下方按钮，然后在弹出的弹窗中点击 打开，即可快捷完成订阅设置</p>
                                                        </div>
                                                        <div class="tab-pane" id="tab5" aria-labelledby="base-tabX5">
                                                            <div class="text-center valign-middle">
                                                                 <p>路由器方案请咨询客服</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Description lists horizontal-->

                                    <!-- Description lists vertical-->
                                    <div class="col-md-12 col-lg-4">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title-wrap bar-info">
                                                    <h4 class="card-title">每日签到 <small
                                                            class="text-muted">签到将会获得流量</small></h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="card-block">
                                                    <p>上次签到时间：{$user->lastCheckInTime()}</p>
                                                    <div class="card-block text-center">
                                                        {if $user->isAbleToCheckin() }
                                                            <p><a id="checkin" class="btn mr-1 btn-round btn-success full-width fit">签到</a></p>
                                                        {else}
                                                            <p><a class="btn mr-1 btn-round btn-secondary full-width fit">今日已签到</a></p>
                                                        {/if}

                                                        <p>签到可领取 100 MB 至 300 MB 范围内的流量， 并获得 4 小时的时长， 每日零时后就可以可签到了</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Description lists vertical-->

                                    <!-- Description lists vertical-->
                                    <div class="col-md-12 col-lg-4">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title-wrap bar-info">
                                                    <h4 class="card-title">流量使用情况 <small
                                                            class="text-muted">数据更新稍微会有点延迟</small></h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="card-block">
                                                    <div class="card-body">
                                                        <div class="card-block text-center">
                                                            <p class="text-left">今日已用 <span
                                                                    class="badge badge-pill badge-primary">{$user->TodayusedTraffic()}</span>
                                                            </p>
                                                            <div class="progress mb-2">
                                                                <div class="progress-bar progress-bar-striped progress-bar-animated"
                                                                    role="progressbar" aria-valuenow="20"
                                                                    aria-valuemin="20" aria-valuemax="100"
                                                                    style="width:calc({($user->transfer_enable==0)?0:($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}%)">
                                                                </div>
                                                            </div>
                                                            <p class="text-left">过去已用 <span
                                                                    class="badge badge-pill badge-danger">{$user->LastusedTraffic()}</span>
                                                            </p>
                                                            <div class="progress mb-2">
                                                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
                                                                    role="progressbar" aria-valuenow="40"
                                                                    aria-valuemin="40" aria-valuemax="100"
                                                                    style="width:calc({($user->transfer_enable==0)?0:$user->last_day_t/$user->transfer_enable*100}%)">
                                                                </div>
                                                            </div>
                                                            <p class="text-left">剩余流量 <span
                                                                    class="badge badge-pill badge-success">{$user->unusedTraffic()}</span>
                                                            </p>
                                                            <div class="progress mb-2">
                                                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success"
                                                                    role="progressbar" aria-valuenow="60"
                                                                    aria-valuemin="60" aria-valuemax="100"
                                                                    style="width:calc({($user->transfer_enable==0)?0:($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}%)">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Description lists vertical-->
                                </div>
                            </section>

                            <section id="description-list-alignment">
                                <div class="row match-height">
                                    <!-- Description lists vertical-->
                                    <div class="col-md-12 col-lg-4">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title-wrap bar-success">
                                                    <h4 class="card-title">最新公告</h4>
                                                </div>
                                                <p>请随时留意系统公告</p>
                                            </div>
                                            <div class="card-body">
                                                <div class="card-block">
                                                    {if $ann != null}
                                                        <p>{$ann->content}</p>
                                                        <br/>
                                                        <strong>查看所有公告请<a href="/user/announcement">点击这里</a></strong>
                                                    {else}
                                                        <div class="text-center valign-middle">
                                                             <p>暂无最新公告</p>
                                                        </div>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Description lists vertical-->

                                    <!-- Description lists horizontal -->
                                    <div class="col-md-12 col-lg-8">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title-wrap bar-warning">
                                                    <h4 class="card-title">流量统计<small
                                                            class="text-muted">过去七日流量使用情况</small>
                                                    </h4>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="card-block">
                                                    <div id="line-area1" class="height-400 lineArea1 lineArea1Shadow">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/ Description lists horizontal-->
                                </div>
                            </section>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        {include file='user/footer.tpl'}
    </body>
    <script src="/theme/convex/app-assets/js/chartist.js"></script>
    <script src="/theme/convex/app-assets/vendors/js/chartist.min.js"></script>
    <script src="/theme/convex/app-assets/vendors/js/sweetalert2.min.js"></script>
    <script>
        function AddSub(url,jumpurl="") {
            let tmp = window.btoa(url);
            window.location.href = jumpurl + tmp;
        }

        $(document).ready(function () {
            $("#checkin").click(function () {
                $.ajax({
                    type: "POST",
                    url: "/user/checkin",
                    dataType: "json",
                    {if $config['enable_checkin_captcha'] == true && $config['captcha_provider'] == 'recaptcha'}
                    data: {
                        recaptcha: grecaptcha.getResponse()
                    },
                    {/if}
                    success: (data) => {
                        if (data.ret) {
                            //$$.getElementById('checkin-msg').innerHTML = data.msg;
                            //$$.getElementById('checkin-btn').innerHTML = checkedmsgGE;
                            //$$.getElementById('msg').innerHTML = data.msg;
                            //$$.getElementById('remain').innerHTML = data.trafficInfo['unUsedTraffic'];
                            //$('.bar.remain.color').css('width', (data.unflowtraffic - ({$user->u}+{$user->d})) / data.unflowtraffic * 100 + '%');
                            swal("成功", data.msg, "success").then(function () {
                                location.reload();
                            }).done();
                            $('#checkin').html('今日已签到').attr("disabled",true).attr("class",'btn mr-1 btn-round btn-secondary full-width fit');
                        } else {
                            swal("错误", data.msg, "error").then(function () {
                                location.reload();
                            }).done();
                        }
                    },
                    error: (jqXHR) => {
                        swal("系统错误", '发生错误：', "error").done();
                    }
                })
            })
        })
    </script>
</html>

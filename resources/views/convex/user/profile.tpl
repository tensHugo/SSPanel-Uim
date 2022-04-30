{$pagename='profile'}
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
                        <section id="description-list-alignment">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="content-header">账户信息</div>
                                </div>
                            </div>
                            <div class="row match-height">
                                <!-- Description lists vertical-->
                                <div class="col-md-12 col-lg-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-info">
                                                <h4 class="card-title">我的账号 <small class="text-muted">账号信息</small></h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <div class="align-self-center halfway-fab text-center">
                                                    <a class="profile-image">
                                                        <img src="/theme/convex/app-assets/img/portrait/medium/avatar-m-9.jpg"
                                                            class="rounded-circle img-border gradient-summer width-100"
                                                            alt="Card image">
                                                    </a>
                                                </div>
                                                <div class="text-center">
                                                    <span class="font-medium-2 text-uppercase">昵称</span>
                                                    <p class="grey font-small-2">{$user->user_name}</p>
                                                    {if $user->is_legalize==0 && $config['is_legalize']==1}
                                                    <a href="#" title="点此进行实名认证"><span class="badge badge-warning">未实名认证</span></a>
                                                    {else}
                                                    <span class="badge badge-success">已实名：{$user->legname}</span>
                                                    {/if}
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 col-sm-6">
                                                        <ul class="no-list-style pl-0 text-center">
                                                            <li class="mb-2">
                                                                <span class="text-bold-500 primary"><a><i
                                                                            class="ft-mail font-small-3"></i>
                                                                        邮箱:</a></span>
                                                                <a
                                                                    class="display-block overflow-hidden">{$user->email}</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-12 col-sm-6">
                                                        <ul class="no-list-style pl-0 text-center">
                                                            <li class="mb-2">
                                                                <span class="text-bold-500 primary"><a><i
                                                                            class="ft-book font-small-3"></i>
                                                                        注册时间:</a></span>
                                                                <span class="display-block overflow-hidden">{$user->reg_date}</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="align-self-center halfway-fab text-center valign-bottom">
                                                    <p class="valign-bottom">
                                                        <a class="btn mr-1 shadow-z-2 btn-info" href="/user/edit">修改资料</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Description lists vertical-->
                                <!-- Description lists horizontal -->
                                <div class="col-md-12 col-lg-8">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title">我的套餐<small class="text-muted">当前生效中的套餐</small>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <table class="table table-striped table-inverse">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>套餐名称</th>
                                                            <th>已用天数</th>
                                                            <th>下次流量重置时间</th>
                                                            <th>套餐过期时间</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {foreach $boughts as $bought}
                                                        	{if $bought->valid()}
                                                            <tr>
                                                                <th scope="row">{$bought->id}</th>
                                                                <td>{$bought->shop()->name}</td>
                                                                <td>{$bought->used_days()} 天</td>
                                                                <td>{$bought->reset_time()}</td>
                                                                <td>{$bought->exp_time()}</td>
                                                            </tr>
                                                            {/if}
                                                        {/foreach}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/ Description lists horizontal-->
                            </div>
                        </section>
                        <section id="description-list-alignment">
                            <div class="row match-height">
                                <div class="col-md-12 col-lg-8">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title">登录十次登录IP<small class="text-muted">请确认都为自己的IP，如有异常请及时修改密码。</small>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <table class="table table-striped table-inverse">
                                                    <thead>
                                                        <tr>
                                                            <th>IP</th>
                                                            <th>时间</th>
                                                            <th>归属地</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                       {foreach $userloginip as $login}
                                                           <tr>
                                                               <td>{$login->ip}</td>
                                                               <td>{date('Y-m-d H:i:s', $login->datetime)}</td>
                                                               <td>{Tools::getIpInfo($login->ip)}</td>
                                                           </tr>
                                                       {/foreach}
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-info">
                                                <h4 class="card-title">最近五分钟使用IP <small class="text-muted">请确认都为自己的IP，如有异常请及时修改连接密码。</small></h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <table class="table table-striped table-inverse">
                                                    <thead>
                                                        <tr>
                                                            <th>IP</th>
                                                            <th>归属地</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {foreach $userip as $single=>$location}
                                                            <tr>
                                                                <td>{$single}</td>
                                                                <td>{$location}</td>
                                                            </tr>
                                                        {/foreach}
                                                    </tbody>
                                                </table>
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
    </body>
</html>

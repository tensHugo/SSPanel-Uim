{$pagename='subscribe_log'}
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
                    <section id="striped-inverse">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title-wrap bar-success">
                                            <h4 class="card-title">订阅记录</h4>
                                        </div>
                                        <p>您可在此查询您账户最近 7 天的订阅记录，确保您的账户没有被盗用。</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-block">
                                            <table class="table table-striped table-inverse">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>订阅类型</th>
                                                        <th>IP</th>
                                                        <th>IP归属地</th>
                                                        <th>时间</th>
                                                        <th>User-Agent</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                {foreach $logs as $log}
                                                    <tr>
                                                        <td>#{$log->id}</td>
                                                        <td>{$log->subscribe_type}</td>
                                                        <td>{$log->request_ip}</td>
                                                        <td>{Tools::getIpInfo($log->request_ip)}</td>
                                                        <td>{$log->request_time}</td>
                                                        <td>{$log->request_user_agent}</td>
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
</body>
</html>

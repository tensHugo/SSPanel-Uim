{$pagename='detect_log'}
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
                                            <h4 class="card-title">审计日志</h4>
                                        </div>
                                        <p>系统会根据特定的规则对特定的url进行拦截，您访问的网址中如有包含色情、赌博、违法言论等违反国家法律法规所禁止的内容时，系统将会拦截禁止您的访问。系统拦截规则将会持续更新。</p>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-block">
                                            <table class="table table-striped table-inverse">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>节点名称</th>
                                                        <th>规则名称</th>
                                                        <th>类型</th>
                                                        <th>审计描述</th>
                                                        <th>时间</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                {foreach $logs as $log}
                                                    {assign var="rule" value=$log->rule()}
                                                    {if $rule != null}
                                                        <tr>
                                                            <td>#{$log->id}</td>
                                                            <td>{$log->Node()->name}</td>
                                                            <td>{$rule->name}</td>
                                                            {if $rule->type == 1}
                                                                <td>数据包明文匹配</td>
                                                            {/if}
                                                            {if $rule->type == 2}
                                                                <td>数据包 hex 匹配</td>
                                                            {/if}
                                                            <td>{$rule->text}</td>
                                                            <td>{date('Y-m-d H:i:s',$log->datetime)}</td>
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
</body>
</html>

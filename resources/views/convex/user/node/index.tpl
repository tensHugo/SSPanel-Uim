{$pagename='node'}
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
                        {$index = 0}
                        {foreach $nodes as $node_class => $class_group}
                        <div class="card collapse-icon accordion-icon-rotate left">
                            <div id="headingCollapse{$index}" class="card-header">
                                <a data-toggle="collapse" href="#collapse{$index}" aria-expanded="true"
                                    aria-controls="collapse{$index}" class="card-title lead">{if $node_class <
                                        1000}试用{elseif $node_class==1000}免费{else}等级 {$node_class - 1000} {/if}用户节点</a>
                            </div>
                            <div id="collapse{$index}" role="tabpanel" aria-labelledby="headingCollapse{$index}"
                                class="collapse show" {if $index>0}aria-expanded="false"{/if}>
                                <div class="row">
                                    {foreach $class_group as $node}
                                    <div class="col-xl-3 col-lg-6 col-12">
                                        <div class="card" style="background-color: #EEEEEE;">
                                            <div class="card-body">
                                                <div class="media align-items-stretch">
                                                    {if $node['online']=='1'}
                                                    <div class="p-2 text-center bg-success rounded-left pt-4" title="节点在线">
                                                        <i class="ft ft-wifi font-large-2 text-white"></i>
                                                    </div>
                                                    {elseif $node['online']=='0'}
                                                    <div class="p-2 text-center bg-danger rounded-left pt-4" title="节点离线">
                                                        <i class="ft ft-wifi-off font-large-2 text-white"></i>
                                                    </div>
                                                    {else}
                                                    <div class="p-2 text-center bg-danger rounded-left pt-4" title="节点离线">
                                                        <i class="ft ft-wifi-off font-large-2 text-white"></i>
                                                    </div>
                                                    {/if}
                                                    <div class="py-2 px-2 media-body">
                                                        <div class="row">
                                                            {if $config['enable_flag'] === true}
                                                            <img class="ml-2" src="/images/prefix/{$node['flag']}" height="20px">
                                                            {/if}
                                                            <h6 class="ml-0">{$node['name']}</h6>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-3 col-md-3 col-lg-3" title="在线人数">
                                                                <i class="fa fa-user text-warning">{if
                                                                    $node['online_user'] == -1} N/A{else}
                                                                    {$node['online_user']}{/if}</i>
                                                            </div>
                                                            {if {$node['bandwidth']}!=0}
                                                            <div class="col-3 col-md-3 col-lg-3" title="节点速率">
                                                                <i
                                                                    class="fa ft-bar-chart-2 text-warning">{$node['bandwidth']}</i>
                                                            </div>
                                                            {/if}
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4 col-md-4 col-lg-4" title="节点流量倍率">
                                                                <i
                                                                    class="fa ft-bar-chart-2 text-warning">{$node['traffic_rate']}x</i>
                                                            </div>
                                                            <div class="col-4 col-md-4 col-lg-4" title="节点负载均衡">
                                                                <i
                                                                    class="fa ft-cpu text-primary">{$node['latest_load']}</i>
                                                            </div>
                                                        </div>
                                                        <div class="mt-2">
                                                            <div class="progress" style="background-color: #9E9E9E;">
                                                                <div class="progress-bar bg-info" role="progressbar"
                                                                    aria-valuenow="{$node['traffic_used']}"
                                                                    aria-valuemin="0"
                                                                    aria-valuemax="{$node['traffic_limit']}"
                                                                    style="width:{if $node['traffic_limit']>0}{$node['traffic_used'] / $node['traffic_limit'] * 100}{else}100{/if}%">
                                                                    {if
                                                                    $node['traffic_limit']>0}{$node['traffic_used']}/{$node['traffic_limit']}GB{else}{$node['traffic_used']}GB{/if}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div hidden="hidden">{$index++}</div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>

        {include file='user/footer.tpl'}
    </body>
</html>

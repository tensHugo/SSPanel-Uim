{$pagename='media'}
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
                                    {if $results != null}
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
                                                        <th>节点</th>
                                                        {foreach $results['0']['unlock_item'] as $key => $value}
                                                            {if $key != 'BilibiliChinaMainland'}
                                                                {if $key == 'BilibiliHKMCTW'}
                                                                    <th>港澳台B站</th>
                                                                {else if $key == 'BilibiliTW'}
                                                                    <th>台湾B站</th>
                                                                {else}
                                                                    <th>{$key}</th>
                                                                {/if}
                                                            {/if}
                                                        {/foreach}
                                                        <th>更新时间</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                {foreach $results as $result}
                                                    <tr>
                                                        <td>{$result['node_name']}</td>
                                                        <td>{$result['unlock_item']['YouTube']}</td>
                                                        <td>{$result['unlock_item']['Netflix']}</td>
                                                        <td>{$result['unlock_item']['DisneyPlus']}</td>
                                                        <td>{$result['unlock_item']['BilibiliHKMCTW']}</td>
                                                        <td>{$result['unlock_item']['BilibiliTW']}</td>
                                                        <td>{$result['unlock_item']['MyTVSuper']}
                                                        <td>{$result['unlock_item']['BBC']}</td>
                                                        <td>{$result['unlock_item']['Abema']}</td>
                                                        <td>{date('Y-m-d H:i:s', $result['created_at'])}</td>
                                                    </tr>
                                                {/foreach}
                                                </tbody>
                                            </table>
                                            {$render}
                                        </div>
                                    </div>
                                    {else}
                                    <div class="alert alert-warning">
                                        管理员尚未启用此功能
                                    </div>
                                    {/if}
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

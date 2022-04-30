{$pagename='ticket'}
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
                                                <h4 class="card-title">工单系统</h4>
                                                <div class="text-right">
                                                    <a class="btn mr-1 shadow-z-2 btn-info" href="/user/ticket/create">创建工单</a>
                                                </div>
                                            </div>
                                            <p>在使用过程中有任何的问题，都可以创建一个工单反馈您遇到的问题。我们的工程师会及时回复并解决！</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <table class="table table-striped table-inverse">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>工单标题</th>
                                                            <th>最后更新时间</th>
                                                            <th>状态</th>
                                                            <th>操作</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    {foreach $tickets as $ticket}
                                                        <tr>
                                                            <th scope="row">{$ticket->id}</th>
                                                            <td>{$ticket->title}</td>
                                                            <td>{$ticket->datetime()}</td>
                                                            {if $ticket->status==1}
                                                               <td><i class="fa fa-dot-circle-o warning font-medium-1 mr-1"></i>工单服务中</td>
                                                            {else}
                                                               <td><i class="fa fa-dot-circle-o danger font-medium-1 mr-1"></i>工单已关闭</td>
                                                            {/if}
                                                            <td>
                                                                {if $ticket->status==1}
                                                                    <a href="/user/ticket/{$ticket->id}/view" class="success p-0" data-original-title="" title="编辑">
                                                                        <i class="fa fa-pencil font-medium-3 mr-2"></i>
                                                                    </a>
                                                                {else}
                                                                    <a href="/user/ticket/{$ticket->id}/view" class="success p-0" data-original-title="" title="查看">
                                                                        <i class="ft ft-eye font-medium-3 mr-2"></i>
                                                                    </a>
                                                                {/if}

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
    </body>
</html>

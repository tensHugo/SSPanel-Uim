{$pagename='ticket'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
    <head>
        <link rel="stylesheet" type="text/css" href="/theme/convex/app-assets/vendors/css/quill.snow.css">
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
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="content-header">{$ticket_main->title}</div>
                            </div>
                        </div>
                        <section id="striped-inverse">
                            <div class="row match-height">
                                {if $ticket_main->status==1}
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-success">
                                                <h4 class="card-title">工单回复</h4>
                                            </div>
                                            <p>您可以再下方回复，或直接关闭工单</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <p>工单回复内容</p>
                                                <div class="row">
                                                    <div class="mx-auto col-md-12">
                                                        <div id="snow-wrapper">
                                                            <div id="snow-container">
                                                                <div class="quill-toolbar">
                                                                    <span class="ql-formats">
                                                                        <select class="ql-header">
                                                                            <option value="1">Heading</option>
                                                                            <option value="2">Subheading</option>
                                                                            <option selected>Normal</option>
                                                                        </select>
                                                                        <select class="ql-font">
                                                                            <option selected>Sailec Light</option>
                                                                            <option value="sofia">Sofia Pro</option>
                                                                            <option value="slabo">Slabo 27px</option>
                                                                            <option value="roboto">Roboto Slab</option>
                                                                            <option value="inconsolata">Inconsolata
                                                                            </option>
                                                                            <option value="ubuntu">Ubuntu Mono</option>
                                                                        </select>
                                                                    </span>
                                                                    <span class="ql-formats">
                                                                        <button class="ql-bold"></button>
                                                                        <button class="ql-italic"></button>
                                                                        <button class="ql-underline"></button>
                                                                    </span>
                                                                    <span class="ql-formats">
                                                                        <button class="ql-list"
                                                                            value="ordered"></button>
                                                                        <button class="ql-list" value="bullet"></button>
                                                                    </span>
                                                                    <span class="ql-formats">
                                                                        <button class="ql-link"></button>
                                                                        <button class="ql-image"></button>
                                                                        <button class="ql-video"></button>
                                                                    </span>
                                                                    <span class="ql-formats">
                                                                        <button class="ql-formula"></button>
                                                                        <button class="ql-code-block"></button>
                                                                    </span>
                                                                    <span class="ql-formats">
                                                                        <button class="ql-clean"></button>
                                                                    </span>
                                                                </div>
                                                                <div class="editor" id="content">

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <a class="btn mr-1 shadow-z-2 btn-info" href="#" id="submit">添加工单</a>
                                                <a class="btn mr-1 shadow-z-2 btn-warning" href="#"
                                                    id="close">添加并关闭工单</a>
                                                <a class="btn mr-1 shadow-z-2 btn-secondary" href="#"
                                                    id="close_directly">直接关闭工单</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                {/if}
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-warning">
                                                <h4 class="card-title">工单内容</h4>
                                            </div>
                                            <p>以下是工单详细内容</p>
                                        </div>
                                        <div class="card-body">
                                            <div class="card-block">
                                                <ul class="list-group">
                                                    {foreach $ticketset as $ticket}
                                                    <li
                                                        class="list-group-item list-group-item-action flex-column align-items-start">
                                                        <div class="d-flex w-100 justify-content-between">
                                                            <h5 class="mb-3">{$ticket->user()->user_name}的回复：</h5>
                                                            <small>{$ticket->datetime()}</small>
                                                        </div>
                                                        <p class="mb-2">{$ticket->content}</p>
                                                    </li>
                                                    {/foreach}
                                                </ul>
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
        <script src="/theme/convex/app-assets/vendors/js/quill.min.js"></script>
        <script src="/theme/convex/app-assets/vendors/js/sweetalert2.min.js"></script>
        <script>
            var editor = new Quill("#snow-container .editor", {
                modules: {
                    toolbar: "#snow-container .quill-toolbar"
                },
                theme: "snow"
            });
            $(document).ready(function () {
                function submit() {
                    $.ajax({
                        type: "PUT",
                        url: "/user/ticket/{$id}",
                        dataType: "json",
                        data: {
                            content: $('.ql-editor').html(),
                            status
                        },
                        success: (data) => {
                            if (data.ret) {
                               swal("成功", '提交工单成功！', "success").done();
                                window.setTimeout("location.href='/user/ticket'", {$config['jump_delay']});
                            } else {
                                swal("错误", data.msg, "error").done();
                            }
                        },
                        error: (jqXHR) => {
                            $("#msg-error").hide(10);
                            $("#msg-error").show(100);
                            $$.getElementById('msg-error-p').innerHTML = `发生错误：${
                                    jqXHR.status
                                    }`;
                        }
                    });
                }
                $("#submit").click(function () {
                    status = 1;
                    submit();
                });
                $("#close").click(function () {
                    status = 0;
                    submit();
                });
                $("#close_directly").click(function () {
                    status = 0;
                    $.ajax({
                        type: "PUT",
                        url: "/user/ticket/{$id}",
                        dataType: "json",
                        data: {
                            content: '这条工单已被关闭',
                            status
                        },
                        success: (data) => {
                            if (data.ret) {
                                swal("成功", '操作成功！', "success").done();
                                window.setTimeout("location.href='/user/ticket'", {$config['jump_delay']});
                            } else {
                                swal("错误", data.msg, "error").done();
                            }
                        },
                        error: (jqXHR) => {
                            $("#msg-error").hide(10);
                            $("#msg-error").show(100);
                            $$.getElementById('msg-error-p').innerHTML = `发生错误：${
                                jqXHR.status
                            }`;
                        }
                    });
                });
            });
        </script>
    </body>
</html>

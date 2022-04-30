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
                        <section class="basic-elements">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="card-title-wrap bar-success">
                                                <h4 class="card-title mb-0">工单创建</h4>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="px-3">
                                                <form class="form">
                                                    <div class="form-body">
                                                        <div class="row">

                                                            <div class="col-md-12">
                                                                <fieldset class="form-group">
                                                                    <label for="disabledInput">工单标题</label>
                                                                    <input type="text" class="form-control" id="title"
                                                                        placeholder="请输入工单标题">
                                                                </fieldset>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="card-block">
                                                <p>工单详细内容</p>
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
                                                <a class="btn mr-1 shadow-z-2 btn-info" href="#" id="submit">提交工单</a>
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
            $(document).ready(function() {
                function submit() {
                    $("#submit").html('正在提交...').attr("disabled",true);
                    $.ajax({
                        type: "POST",
                        url: "/user/ticket",
                        dataType: "json",
                        data: {
                            content: $('.ql-editor').html(),
                            markdown: $('.editormd-markdown-textarea').val(),
                            title: $('#title').val()
                        },
                        success: (data) => {
                           if (data.ret) {
                              swal("成功", '提交工单成功', "success").done();
                              window.setTimeout("location.href='/user/ticket'", {$config['jump_delay']});
                           }else {
                               //错误的输出
                             $("#submit").html('提交工单').attr("disabled",false);
                             swal("错误", data.msg, "error").done();
                           }
                        },
                        error: (jqXHR) => {
                            $("#msg-error").hide(10);
                            $("#msg-error").show(100);
                        }
                    });
                }
                $("#submit").click(function() {
                    submit()
                });
            });
        </script>
    </body>
</html>

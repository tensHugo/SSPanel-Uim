{$pagename='theme'}
<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
    <!--head结束区-->

    <body data-col="1-column" class=" 1-column  blank-page blank-page">
        <div class="wrapper">
            <!--Error page starts-->
            <section id="error">
                <div class="container-fluid">
                    <div class="row full-height-vh">
                        <div class="col-12 d-flex align-items-center justify-content-center gradient-aqua-marine">
                            <div class="card px-3 py-2 box-shadow-2">
                                <div class="card-body">
                                    <div class="card-block">
                                        <div class="error-container">
                                            <div class="no-border">
                                                <div class="text-center text-bold-700 grey darken-2 mt-5"
                                                    style="font-size: 11rem; margin-bottom: 4rem;">404</div>
                                            </div>
                                            <div class="error-body">
                                                <div class="py-2 justify-content-center">
                                                    <div class="text-center">
                                                        <a href="/user"
                                                            class="btn btn-danger px-4 py-2 text-uppercase white font-small-4 box-shadow-2 border-0"><i
                                                                class="ft-home"></i> 返回首页</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="error-footer bg-transparent">
                                                <div class="row">
                                                    <p class="text-muted text-center col-12 py-1">© 2018 <a>Convex
                                                        </a>Crafted with <i class="ft-heart font-small-3"></i> by <a
                                                            href="https://themeforest.net/user/pixinvent"
                                                            target="_blank">PIXINVENT</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--Error page ends-->
        </div>

        {include file='user/footer.tpl'}
    </body>
</html>

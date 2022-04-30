<div data-active-color="white" data-background-color="aqua-marine" data-image="app-assets/img/sidebar-bg/02.jpg"
    class="app-sidebar">
    <div class="sidebar-header">
        <div class="logo clearfix"><a href="index" class="logo-text float-left">
                <div class="logo-img"><img src="/theme/convex/app-assets/img/logo.png" alt="Convex Logo" /></div><span
                    class="text align-middle">控制台</span>
            </a><a id="sidebarToggle" href="javascript:;" class="nav-toggle d-none d-sm-none d-md-none d-lg-block"><i
                    data-toggle="expanded" class="ft-disc toggle-icon"></i></a><a id="sidebarClose" href="javascript:;"
                class="nav-close d-block d-md-block d-lg-none d-xl-none"><i class="ft-circle"></i></a></div>
    </div>
    <div class="sidebar-content">
        <div class="nav-container">
            <ul id="main-menu-navigation" data-menu="menu-navigation" class="navigation navigation-main">
                <li {if $pagename=='index'}class="active"{/if}><a href="/user"><i class="icon-home"></i><span data-i18n=""
                            class="menu-title">主页</span></a>
                </li>
                <li class="has-sub nav-item"><a href="#"><i class="fa fa-user"></i><span data-i18n=""
                            class="menu-title">用户中心</span></a>
                    <ul class="menu-content">
                        <li {if $pagename=='profile'}class="active"{/if}><a href="/user/profile" class="menu-item">账户信息</a>
                        </li>
                        {if $config['is_legalize']==1}
                        <li {if $pagename=='legalize'}class="active"{/if}><a href="/user/legalize" class="menu-item">认证中心</a>
                        </li>
                        {/if}
                        <li {if $pagename=='ticket'}class="active"{/if}><a href="/user/ticket" class="menu-item">工单系统</a>
                        </li>
                        <li {if $pagename=='invite'}class="active"{/if}><a href="/user/invite" class="menu-item">注册邀请</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub nav-item"><a href="#"><i class="ft ft-navigation"></i><span data-i18n=""
                            class="menu-title">使用管理</span></a>
                    <ul class="menu-content">
                        <!-- <li {if $pagename=='#'}class="active"{/if}><a href="#" class="menu-item">文档中心</a>
                        </li>
                        <li {if $pagename=='#'}class="active"{/if}><a href="#" class="menu-item">问答中心</a>
                        </li> -->
                        <li {if $pagename=='node'}class="active"{/if}><a href="/user/node" class="menu-item">节点列表</a>
                        </li>
                        <li {if $pagename=='subscribe_log'}class="active"{/if}><a href="/user/subscribe_log" class="menu-item">订阅日志</a>
                        </li>
                        <li {if $pagename=='media'}class="active"{/if}><a href="/user/media" class="menu-item">流媒体解锁</a>
                        </li>
                        <li {if $pagename=='detect_log'}class="active"{/if}><a href="/user/detect/log" class="menu-item">审计记录</a>
                        </li>
                    </ul>
                </li>
                <li class="has-sub nav-item"><a href="#"><i class="ft ft-shopping-cart"></i><span data-i18n=""
                            class="menu-title">充值购买</span></a>
                    <ul class="menu-content">
                        <li {if $pagename=='code'}class="active"{/if}><a href="/user/code" class="menu-item">充值中心</a>
                        </li>
                        <li {if $pagename=='shop'}class="active"{/if}><a href="/user/shop" class="menu-item">套餐购买</a>
                        </li>
                        <li {if $pagename=='bought'}class="active"{/if}><a href="/user/bought" class="menu-item">购买记录</a>
                        </li>
                        <!-- <li {if $pagename=='donate'}class="active"{/if}><a href="/user/donate" class="menu-item">捐赠公式</a>
                        </li> -->
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="sidebar-background"></div>
</div>


<nav class="navbar navbar-expand-lg navbar-light bg-faded">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" data-toggle="collapse" class="navbar-toggle d-lg-none float-left"><span
                    class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                    class="icon-bar"></span><span class="icon-bar"></span></button><span
                class="d-lg-none navbar-right navbar-collapse-toggle"><a class="open-navbar-container"><i
                        class="ft-more-vertical"></i></a></span><a id="navbar-fullscreen" href="javascript:;"
                class="mr-2 display-inline-block apptogglefullscreen"><i
                    class="ft-maximize blue-grey darken-4 toggleClass"></i>
                <p class="d-none">fullscreen</p>
            </a>
            <div class="dropdown ml-2 display-inline-block"><a href="user/announcement" data-toggle="dropdown"
                    class="position-relative"><i class="ft-volume-2 blue-grey darken-4"></i><span
                        class="mx-1 blue-grey darken-4 text-bold-400">公告</span></a>
            </div>
            <div class="dropdown ml-2 display-inline-block"><a id="apps" href="#" data-toggle="dropdown"
                    class="nav-link position-relative dropdown-toggle"><i class="ft-edit blue-grey darken-4"></i><span
                        class="mx-1 blue-grey darken-4 text-bold-400">客户端下载</span></a>
                <div class="apps dropdown-menu">
                    <div class="arrow_box"><a href="chat.html" class="dropdown-item py-1"><span>windows端</span></a><a
                            href="taskboard.html" class="dropdown-item py-1"><span>android端</span></a><a
                            href="calendar.html" class="dropdown-item py-1"><span>mac端</span></a>
                        <a href="calendar.html" class="dropdown-item py-1"><span>ios端</span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar-container">
            <div id="navbarSupportedContent" class="collapse navbar-collapse">
                <ul class="navbar-nav">
                    <li class="dropdown nav-item mr-0"><a id="dropdownBasic3" href="#" data-toggle="dropdown"
                            class="nav-link position-relative dropdown-user-link dropdown-toggle"><span
                                class="avatar avatar-online"><img id="navbar-avatar"
                                    src="/theme/convex/app-assets/img/portrait/small/avatar-s-3.jpg"
                                    alt="avatar" /></span>
                            <p class="d-none">用户设置</p>
                        </a>
                        <div aria-labelledby="dropdownBasic3" class="dropdown-menu dropdown-menu-right">
                            <div class="arrow_box_right"><a href="/user/edit" class="dropdown-item py-1"><i
                                        class="ft-edit mr-2"></i><span>我的资料</span></a>
                                        {if $user->is_admin}
                                        <a href="/admin" class="dropdown-item py-1"><i
                                        class="ft-settings mr-2"></i><span>管理后台</span></a>
                                        {/if}
                                <div class="dropdown-divider"></div><a href="/user/logout" class="dropdown-item"><i
                                        class="ft-power mr-2"></i><span>退出登录</span></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

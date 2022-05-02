<!DOCTYPE html>
<html>
    <!--head加载区-->
    {include file='user/header.tpl'}
    <!--head结束区-->
    <body data-col="2-columns">
        <div class="row text-center">
            <div class="col-xl-12 col-lg-12 col-12 text-center" style="margin-top: 200px;">
                {if $code=='PASS'}
                <i class="icon-check text-success font-large-3"></i>
                {else}
                <i class="icon-close text-danger font-large-3"></i>
                {/if}
                <p class="font-medium-3">{$msg}</p>
            </div>
        </div>
    {include file='user/footer.tpl'}
    </body>
</html>

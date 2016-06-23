{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
{%require name="manage:static/common/underscore-min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.css"%}
{%require name="manage:static/common/ckeditor/ckeditor.js"%}
{%require name="manage:widget/btn-action/btn-action.css"%}
{%require name="manage:static/bootstrap/3.3.5/css/bootstrap.css"%}
{%require name="manage:static/bootstrap/3.3.5/js/bootstrap.js"%}
{%/block%}
{%block name="right-content-table"%}
{%assign var="domain" value="http://mr-hug.com"%}
<div class="outer-wrap">
    <h2>首页Banner</h3>
    <div id="myCarousel" class="carousel slide" data-interval="false">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <ul class="layout-ul banner carousel-inner" role="listbox" layout_id=1>
            {%for $i=0;$i<4;$i++%}
            {%assign var="banner_product" value=$banner[$i]['product']%}
            {%assign var="banner_user" value=$banner[$i]['user']%}
            <li content_type=1 content_id="{%$banner[$i]['content_id']%}" weight={%$i+1%} class="item {%if $i ==0%}active{%/if%}">
            <!-- detail_surface_url -->
            <img class="detail_surface_url" src="{%if strpos($banner_product.detail_surface_url,"http://") === false%}{%$domain%}{%/if%}{%$banner_product.detail_surface_url%}" alt="">
            <div class="inner-wrap">
                <div class="avator-wrap">
                    <img class="avator" src="{%if strpos($banner_user.avator,"http://") === false%}{%$domain%}{%/if%}{%$banner_user.avator%}" alt="">
                    <p class="username">{%$banner_user.username%}</p>
                    <p class="live_place">{%$banner_user.live_place%}</p>
                </div>
                <div class="product-wrap">
                    <h3 class="main_title">{%$banner_product.main_title%}</h3>
                    <h3 class="sub_title">{%$banner_product.sub_title%}</h3>
                </div>
            </div>
            </li>
            {%/for%}
        </ul>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <hr>
    <h2>跟随当地人</h3>
    <ul class="layout-ul arrow" layout_id=2>
        {%assign var="arrow_category" value=[]%}
        {%assign var="arrow_product" value=[]%}
        {%assign var="arrow_user" value=[]%}
        {%for $i=0;$i<10;$i++%}
        {%if $i==1||$i==7%}
            <ul class="arrow-category-wrap">
                {%$arrow_category = $arrow[$i]%}
                <li class="arrow-category arrow-category-left" tabindex="-1" content_type=2 content_id="{%$arrow[$i]['content_id']%}" weight={%$i+1%}>
                    <p class="category">{%$arrow_category.category%}</p>
                    <hr>
                    <p><em class="hug_num" style="display:inline">{%$arrow_category.hug_num%}</em>位hug期待与你相见</p>
                </li>
                {%$i = $i+1%}
                {%$arrow_category = $arrow[$i]%}
                <li class="arrow-category arrow-category-right" tabindex="-1"  content_type=2 content_id="{%$arrow[$i]['content_id']%}" weight={%$i+1%}>
                    <p class="category">{%$arrow_category.category%}</p>
                    <hr>
                    <p><em class="hug_num" style="display:inline">{%$arrow_category.hug_num%}</em>位hug期待与你相见</p>
                </li>

            </ul>
        {%else%}
        {%$arrow_product = $arrow[$i].product%}
        {%$arrow_user = $arrow[$i].user%}
            <li class="arrow-product" content_type=1 content_id="{%$arrow[$i]['content_id']%}" weight={%$i+1%}>
            <img class="index_img_url" src="{%if strpos($arrow_product.index_img_url,"http://") === false%}{%$domain%}{%/if%}{%$arrow_product.index_img_url%}" alt="">
                <div class="text-wrap">
                    <div class="text-inner-wrap cf">
                        <span class="price-icon">￥</span>
                        <p class="price_total">{%$arrow_product.price_total%}</p>
                        <p class="username">{%$arrow_user.username%}</p>
                        <p class="region">{%$arrow_product.region%}</p>
                    </div> 
                    <p class="main_title">{%$arrow_product.main_title%}</p>
                </div> 
            </li>
        {%/if%}
        {%/for%}
    </ul>
    <hr>
    <h2>热门城市推荐</h2>
    <ul class="layout-ul hot" layout_id=3>
        {%for $i=0;$i<9;$i++%}
        {%$hot_item = $hot[$i]%}
        <li content_type=3 content_id="{%$hot_item.content_id%}" weight="{%$i+1%}">
            <img class="surface_url" src="{%if strpos($hot_item.surface_url,"http://") === false%}{%$domain%}{%/if%}{%$hot_item.surface_url%}" alt="">
            <p class="region_name">{%$hot_item.region_name%}</p>
        </li>
        {%/for%}
    </ul>
    <hr>
    <h2>遇见Mr.Hug</h2>
    <ul class="layout-ul story" layout_id=4>
        {%for $i=0;$i<6;$i++%}
        {%$story_item = $story[$i]%}
            <li content_type=4 content_id="{%$story_item.content_id%}" weight="{%$i+1%}">
                <a class="video_url" href="{%$story_item.video_url%}" target="_blank">
                    <img class="surface_url" src="{%if strpos($story_item.surface_url,"http://") === false%}{%$domain%}{%/if%}{%$story_item.surface_url%}" alt="">
                    <p class="main_title">{%$story_item.main_title%}</p>
                    <p class="username">Mr.hug:{%$story_item.username%}</p>
                    <div class="play-box">
                        <span class="glyphicon glyphicon-play" aria-hidden="true"></span>
                    </div>
                </a>
            </li>
        {%/for%}
    </ul>
</div>
<script id="snip-btn-select" type="text/template">
    {%widget name="manage:widget/product-index/btn-select.tpl"%}
</script>
    {%widget name="manage:widget/product-index/form-select.tpl"%}
{%/block%}

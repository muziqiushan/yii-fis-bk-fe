<ul class="left-nav-list cf">
{%assign var=nav_list
value=['site/index'=>'仪表盘','user/index'=>'用户管理','product/create'=>'产品发布','product/manage'=>'产品管理','story/create'=>'添加故事','product/index'=>'首页管理','booking/index'=>'订单管理','category/index'=>'分类管理','tag/index'=>'标签管理','city/index'=>'地区管理','letter/index'=>'私信管理','static/index'=>'静态页管理','withdraw/index'=>'提现管理','payable/index'=>'提现下载','config/index'=>'配置管理','user/set-passwd'=>'密码修改','live/index'=>'直播管理','live/planet-theme-index'=>'星球联播主题','live/solar-schedule-index'=>'太阳系安排表','coupon/channel-index'=>'优惠券频道','coupon/event-index'=>'优惠券事件','coupon/category-index'=>'优惠码类别','export/index'=>'导出管理','message/index'=>'消息管理','user-feedback/index'=>'用户反馈']%}
{%if empty($nav)%}
    {%assign var=nav value="仪表盘"%}
{%/if%}
    <input class="left-nav-item left-nav-search" name="left-nav" type="text" class="left-nav-search" placeholder="左侧导航按关键词搜索"/>
    <hr/>
    <form enctype="multipart/form-data" action="/file/upload" method="post" class="left-nav-item">
        <button class="action-btn blue left-nav-upload-btn">上传图片</button>
        <input class="left-nav-upload" name="left-nav" type="file" class="left-nav-upload"/>
        <!-- <input class="left&#45;nav&#45;upload" type="submit" class="left&#45;nav&#45;upload"/> -->
    </form>
{%foreach $nav_list as $k=>$v%}
    <a class="left-nav-item {%if $nav==$v%}cur {%$k%}{%/if%}"
href="/{%$k%}?nav={%$v%}" >{%$v%}</a>
{%/foreach%}
{%script%}
    require('./left-nav.js')
{%/script%}
<!--<a class="left-nav-item" href="">产品管理</a>-->
<!--<a class="left-nav-item" href="">分类管理</a>-->
<!--<a class="left-nav-item" href="">用户管理</a>-->
<!--<a class="left-nav-item" href="">广告管理</a>-->
<!--<a class="left-nav-item" href="">公告管理</a>-->
<!--<a class="left-nav-item" href="">密码修改</a>-->
</ul>

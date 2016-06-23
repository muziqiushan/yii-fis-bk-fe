{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
{%require name="manage:static/common/underscore-min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.css"%}
{%require name="manage:static/common/ckeditor/ckeditor.js"%}
{%require name='manage:widget/btn-action/btn-action.css'%}
{%/block%}
{%block name="right-content-table"%}
{%assign var="domain" value="http://mr-hug.com/"%}
<ul class="right-content-tab-list">
    <li class="right-content-tab-list-item"><a class="right-content-tab-a" href="#" data-target="right-content-div1">1. 基础概况</a></li>
    <li class="right-content-tab-list-item"><a class="right-content-tab-a" href="#" data-target="right-content-div2">2. 封面设置</a></li>
    <li class="right-content-tab-list-item"><a class="right-content-tab-a" href="#" data-target="right-content-div3">3. 活动介绍</a></li>
    <li class="right-content-tab-list-item"><a class="right-content-tab-a" href="#" data-target="right-content-div4">4. 时间地点</a></li>
    <li class="right-content-tab-list-item"><a class="right-content-tab-a" href="#" data-target="right-content-div5">5. 收费情况</a></li>
</ul>
<form enctype="multipart/form-data" class="right-content-div-contain" method="POST" action="/product/save">
    <div id="head3-title" class="head3-title cf">
        <!-- @new -->
        {%if !empty($product.pid) %}
        <input type="hidden" name="pid" value="{%$product.pid%}">
        {%/if%}
        <span>编辑我的活动</span>
        <!-- <input class="btn&#45;commit green" type="submit" value="提交审核"> -->
        <input class="bnt-save blue" type="submit"  value="保存" >
    </div>
    <!-- 基础概括 -->
    <div id="right-content-div1" class="right-content-div">
        <ul>
            <li class="cf">
            <label for="hug">分配活动给hug</label>
            <select id="hug" name="uid">
                {%foreach $hugs as $v%}
                <option value="{%$v.uid%}" {%if $v.uid == $product.uid %}selected=true{%/if%}>{%$v.username%}</option>
                {%/foreach%}
            </select>
            <label for="hug">（手机号）</label>
            <select id="hug_phone">
                {%foreach $hugs as $v%}
                <option value="{%$v.uid%}" {%if $v.uid == $product.uid %}selected=true{%/if%}>{%$v.mobile%}</option>
                {%/foreach%}
            </select>
            </li>
            <li class="cf">
            <label for="country">活动所在地</label>
            <select id="country" name="country_id" class="region">
                <option value="0">请选择国家/地区</option>
                {%foreach $top_region as $region%}
                <option value="{%$region.region_id%}" {%if $region.region_id == $product.country_id %}selected=true{%/if%}>{%$region.region_name%}</option>
                {%/foreach%}
            </select>
            {%if !empty($product.province_id) && !empty($provinces) %}
            <span class="mr-10 ml-10">—</span>
            <select id="province" name="province_id" class="region">
                <option value="0">请选择省/州/邦</option>
                {%foreach $provinces as $v%}
                <option value="{%$v.region_id%}" {%if $v.region_id == $product.province_id %}selected=true{%/if%}>{%$v.region_name%}</option>
                {%/foreach%}
            </select>
            {%/if%}
            {%if !empty($product.city_id) && !empty($citys) %}
            <span class="mr-10 ml-10">—</span>
            <select id="city" name="city_id">
                <option value="0">请选择目的地</option>
                {%foreach $citys as $v%}
                <option value="{%$v.region_id%}" {%if $v.region_id == $product.city_id %}selected=true{%/if%}>{%$v.region_name%}</option>
                {%/foreach%}
            </select>
            {%/if%}
            </li>
            <li class="cf">
            <label for="category">活动主题类型</label>
            <select id="category" name="category_id">
                <option value="0">选择主题</option>
                {%foreach $categorys as $v%}
                <option value="{%$v.category_id%}" {%if $v.category_id == $product.category_id %}selected=true{%/if%}>{%$v.category%}</option>
                {%/foreach%}
            </select>
            </li>
            <li class="cf">
            <label for="quota">最多接待人数</label>
            <input id="quota_max" name="quota_max" value="{%($product.quota_max)?($product.quota_max):5%}" />
            <span class="ml-10">人</span>
            </li>
            <li class="cf">
            <label for="duration">活动持续时长</label>
            <input id="duration" name="duration" value="{%($product.duration)?($product.duration):3%}"/>
            <span class="ml-10">小时</span>
            </li>
            <li class="cf">
            <label for="province">支持的语言</label>
            {%foreach $langs as $v%}
            <input name="lang_ids[]" type="checkbox" value="{%$v.lang_id%}" {%if !empty($product.lang_ids)&&in_array($v.lang_id,$product.lang_ids)%}checked{%/if%}><span class="mr-10">{%$v.lang%}</span>
            {%/foreach%}
            </li>
            <li class="cf">
                <label for="feature">活动特色</label>
                <textarea id="feature" name="feature" cols="30" rows="10">{%$product.feature%}</textarea>
            </li>
            <li class="cf">
                <label for="attention">注意事项</label>
                <textarea id="attention" name="attention" cols="30" rows="10">{%$product.attention%}</textarea>
            </li>
            <li class="cf">
                <label for="risk">风险说明</label>
                <textarea id="risk" name="risk" cols="30" rows="10">{%$product.risk%}</textarea>
            </li>
        </ul>
    </div>
    <!-- 封面设置 -->
    <div id="right-content-div2" class="right-content-div">
        <ul>
            <li class="cf">
            <label for="search-img">小图设置</label>
            <div class="img-input-wrap search-img">
                <span class="img-input-label img-add-label">搜索结果页照片</span>
                <span class="img-input-label img-add-btn">添加图片</span>
                <img class="input-img" src="{%$domain%}{%$product.index_img_url%}"/>
                <input class="img-input" type="file" name="index">
            </div>
            </li>
            <li class="cf">
            <label for="detail-banner-img">大图设置</label>
            <div class="img-input-wrap detail-banner-img">
                <span class="img-input-label img-add-label">活动详情页首屏大图，图片建议选择尺寸1600像素以上，3M以内的高清大图</span>
                <span class="img-input-label img-add-btn">添加图片</span>
                <img class="input-img" src="{%$domain%}{%$product.detail_surface_url%}"/>
                <input  class="img-input" type="file" name="surface">
            </div>
            </li>
        </ul>
    </div> 
    <div id="right-content-div3" class="right-content-div">
        <ul>
            <li class="cf">
            <label for="main-title">主标题</label>
            <input type="text" name="main_title" value="{%$product.main_title%}" placeholder="请填写活动主标题"/>
            </li>
            <li class="cf">
            <label for="sub-title">副标题</label>
            <input type="text" name="sub_title" value="{%$product.sub_title%}"/>
            </li>
            <li class="cf">
            <label for="detail-banner-img">图文描述</label>
            <div class="detail-paragraph-contain">
                {%if empty($product.details)%}
                <div class="detail-paragraph cf" data-last_index=1>
                    <!-- 索引input -->
                    <input class="detail-index" name="detail[1][index]" value="1" readonly=true>
                    <span>/10</span>
                    <a class="detail-btn detail-btn-del" href="javascript:void(0)">删除</a>
                    <div class="img-input-wrap">
                        <img class="detail-img input-img" src="" alt="点击上传照片">
                        <!-- img input -->
                        <input class="img-input" type="file" name="1">
                    </div> 
                    <!-- description input -->
                    <textarea id="editor1" class="detail-desc" name="detail[1][description]" placeholder="这里添加文字描述..." cols="80" rows="10"></textarea>
                </div>
                {%else%}
                {%foreach $product.details as $k=>$v %}
                <div class="detail-paragraph cf" {%if $k == (count($product.details)-1)%}data-last_index={%$v.index%}{%/if%}>
                    <!-- 索引input -->
                    <input class="detail-index" type="" name="detail[detail-{%$v.detail_id%}][index]" value={%$v.index%} readonly=true>
                    <span>/10</span>
                    <a class="detail-btn detail-btn-del" href="javascript:void(0)">删除</a>
                    <div class="img-input-wrap">
                        <img class="detail-img input-img" src="{%$domain%}{%$v.img_url%}" alt="点击上传照片">
                        <!-- img input -->
                        <input class="img-input" type="file" name="detail-{%$v.detail_id%}">
                    </div> 
                    <!-- description input -->
                    <textarea  id="editor{%$k%}" class="detail-desc" name="detail[detail-{%$v.detail_id%}][description]" placeholder="这里添加文字描述..." cols="80" rows="10">{%$v.description%}</textarea>
                </div>
                {%/foreach%}
                {%/if%}
            </div> 
            <a class="detail-btn detail-btn-add" href="javascript:void(0)">+新增图文(<i class="cur-detail-num">{%(count($product.details))?(count($product.details)):1%}</i>/10)</a>
            </li>
            <li class="cf">
            <label for="">特色标签</label>
            <div class="detail-tag-contain">
                {%foreach $tags as $v%}
                <input name="tag_ids[]" type="checkbox" value="{%$v.tag_id%}" {%if !empty($product.tag_ids)&&in_array($v.tag_id,$product.tag_ids)%}checked{%/if%}><span class="mr-10">{%$v.tag%}</span>
                {%/foreach%}
            </div> 
            </li>
            <label for=""> </label>
            <div class="dashed-box">为活动添加特色标签，至多可选5个</div>
        </ul>
    </div>
    <ul id="right-content-div4" class="right-content-div">
        <li class="cf">
        <label for="">可预约日期</label>
        <div class="datepicker-wrap">
            <div class="datepicker" data-date="{%date('Y-m-d',time())%}">
            </div>
            <input id="datepicker-alt" type="hidden">
        </div>
        <div class="timepicker-wrap ml-20 cf">
            <input id="quotas" name="quotas" value='{%($product.quotas)?(json_encode($product.quotas)):""%}' type="hidden" />
            <div class="timepicker-title-date">{%date('Y年m月d日',time())%}</div>
            <div class="timepicker-item cf" data-time="">
                <select class="timepicker">
                    <option value="">--:--</option>
                    {%for $i=0;$i<24;$i++%}
                    <option value="{%sprintf('%02d',$i)%}:00">{%sprintf('%02d',$i)%}:00</option>
                    {%/for%}
                </select>
                <a class="time-btn time-btn-del">删除时间</a>
            </div> 
            <p class="cf">
                <a class="time-btn time-btn-add">添加时间</a>
                <label class="repeat-weekly-label" for="repeat-weekly">每周重复</label> 
                <input id="repeat-weekly" class="repeat-weekly" class="checkbox fr" type="checkbox" />
            </p> 
        </div>
        </li>
        <li class="cf">
        <label for="meet_address">见面地点</label>
        <input id="meet_address" type="text" name="meet_address" value="{%$product.meet_address%}" placeholder="输入见面地点位置，准确标记位置"/>
        </li>
        <li class="cf">
        <label for="address_note">地点备注</label>
        <textarea id="address_note" type="text" name="address_note"placeholder="如地点无法定位或有其他信息说明时,请详细备注">{%$product.address_note%}</textarea>
        </li>
    </ul>
    <div id="right-content-div5" class="right-content-div">
        <ul>
            <li class="cf">
            <label for="price_total">售卖价</label>
            <input type="text" name="price_total" placeholder="平台展示的销售价格(￥)" value="{%$product.price_total%}"/>
            <span class="ml-10">/每人</span>
            </li>
            <li class="cf">
            <label for="price_for_hug">结算价</label>
            <input type="text" name="price_for_hug" placeholder="Hug收到的服务费(￥)" value="{%$product.price_for_hug%}"/>
            <span class="ml-10">/每人</span>
            </li>
            <li class="cf">
            <label for="detail-banner-img">费用包括</label>
            {%foreach $price_includes as $v%}
            <input name="price_include_ids[]" type="checkbox" value="{%$v.include_id%}" {%if !empty($product.price_include_ids)&&in_array($v.include_id,$product.price_include_ids)%}checked{%/if%}><span class="mr-10">{%$v.include_content%}</span>
            {%/foreach%}
            </li>
            <li class="cf">
            <label for="price_desc">费用备注</label>
            <textarea id="price_desc" name="price_desc" >{%$product.price_desc%}</textarea>
            </li>
            <li class="cf">
                <label for="unsubscribe_policy">退订政策</label>
                <textarea id="unsubscribe_policy" name="unsubscribe_policy" cols="30" rows="10" placeholder="退订政策">{%$product.unsubscribe_policy%}</textarea>
            </li>
        </ul>
    </div>
</form>
<!-- 省市联动 -->
{%literal%}
<script id="region-next" type="text/template">
<span class="mr-10 ml-10">—</span>
    <%var level = data[0].level%>
        <%if(level == 1)%>
            <select id="country_id" name="country_id" class="region" data-level=<%=level%>>
            <option value="0">请选择国家/地区</option>
        <%else if(level == 2)%>
            <select id="province_id" name="province_id" class="region" data-level=<%=level%>>
            <option value="0">请选择省/州/邦</option>
        <%else if(level == 3)%>
            <select id="city_id" name="city_id" data-level=<%=level%>>
            <option value="0">请选择目的地</option>
        <%for (var i in data){%>
            <option value="<%=data[i].region_id%>"><%-data[i].region_name%></option>
        <%}%>
    </select>

</script>
{%/literal%}
{%/block%}

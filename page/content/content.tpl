{%extends file="manage/page/base/base.tpl"%}
{%block name="right-main"%}
{%block name="assign-nav"%}
    {%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js"%}
    {%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.css"%}
{%if empty($nav)%}
{%assign var="nav" value="仪表盘"%}
{%/if%}
{%/block%}
{%assign var="domain" value="http://mr-hug.com"%}
<div class="right-content-wrap cf">
    {%block name="right-content-head right-content-head1"%}
    <h3 class="right-content-head right-content-head1">{%$nav%}</h3>
    {%/block%}
    {%block name="right-content-head2"%}
    <div class="right-content-head right-content-head2">管理后台 > {%$nav%} {%if
        !empty($sub_nav)%}> {%$sub_nav%}{%/if%}</div>
    {%/block%}
    {%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        <input type="TEXT" class="right-content-search-input search-input" name="{%$name%}" value="" placeholder="{%Yii::t('app', $name)%}">
        <!--<input type="BUTTON" class="right-content-search-btn" value="搜索"></input>-->
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='搜索' class='blue' action='search'%}
    </div>
    {%/block%}
    {%block name="right-content-table"%}
    <div class="right-table-wrap {%$class%}">
        <div class="right-table-header" for="">{%$nav%}</div>
        <table class="right-content-table">
            <thead>
                <tr>
                    <th>#</th>
                    {%foreach $head as $k=>$v%}
                        {%if strpos($k,'-') === 0 %}
                            {%continue%}
                        {%/if%}
                        {%if is_array($v) %}
                            {%$v = Yii::t('app',$k)%} 
                        {%/if%}
                    <th>{%$v%}</th>
                    {%/foreach%}
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            {%for $i = 0;$i< 10;$i++%}
            {%assign var="oneData" value=[] %}
            {%foreach $head as $k=>$v%} 
                {%$oneData[$k] = null%}
            {%/foreach%}
            {%$data[] = $oneData%}
            {%/for%}
            {%foreach $data as $v1%}
            <tr {%if !is_null($v1[$id])%}data-{%$id%}= "{%$v1[$id]%}"{%else%}class="tr-empty"{%/if%}>
                <td>{%$v1[$id]%}</td>

                {%foreach $head as $k=>$v%}
                    <!-- 如果是'-'开头的key,则不显示,类似input[type=hidden] -->
                    {%if strpos($k,'-') === 0 %}
                        {%continue%}
                    {%/if%}
                    {%assign var="name" value=$k%}
                    {%assign var="class" value=""%}
                    {%assign var="value" value=$v1[$name]%}
                    {%if is_array($v)%}
                        {%assign var="str_option" value=''%}
                        {%assign var="key" value=""%}
                        {%assign var="val" value=""%}
                        {%foreach $v as $option%}
                            {%$key=key($option)%}
                            {%$val=$option[$key]%}
                            {%if $key == $value%}
                                {%$str_option ="$str_option <option value=$key selected=true>$val</option>"%}
                            {%else%}
                                {%$str_option ="$str_option <option value=$key>$val</option>"%}
                            {%/if%}
                        {%/foreach%}
                        {%$value = "<select name='$name'>$str_option</select>"%}
                    {%/if%}
                    {%if strpos($name,'_') === 0%} 
                       {%$name = substr($name,1)%}
                       {%$value = $v1[$name]%}
                    {%else%}
                       {%$class = "modifiable"%}
                    {%/if%}
                    <!-- 图片内容 -->
                    {%if strpos($name,'_imgurl') !== false|| strpos($name,'surface_url') !== false%}
                    {%$value = "<img {%if !empty($value)%}src='{%if strpos($value,"http://") === false%}{%$domain%}{%/if%}$value'{%/if%} class='right-content-td-img' alt='暂无图片'/>"%}
                    {%/if%} 
                    {%if strpos($name,'_time') !== false%}
                        {%$value = date('Y-m-d H:i:s',$value) %}
                    {%/if%} 
                    <!-- 筛选内容 -->
                    {%if strpos($name,'if_') !== false%}
                        {%if $value == 0%}
                            {%$value = "<select name='$name'><option value=0 selected=true>否</option><option value=1>是</option></select>"%}
                        {%else%}
                            {%$value = "<select name='$name'><option value=0>否</option><option value=1 selected=true>是</option></select>"%}
                        {%/if%} 
                    {%/if%} 
                    <td name="{%$name%}" class="{%$class%}">{%$value|escape:none%}</td>
                {%/foreach%}

                <td class="btn-action-list">
                    <div class="btn-action-contain cf">
                    {%block name="btn-action-list"%}
                    {%/block%}
                    </div> 
                </td>
            </tr>
            {%/foreach%}
            </tbody>
        </table>
        {%widget name="manage:widget/pagger/pagger.tpl"%}
    </div> 
    {%/block%}
</div> 
{%/block%}

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
        {%foreach $head_select as $name=>$value%}
            <select id="" name="{%$name%}" class="action-btn action-btn-select">
                {%foreach $value as $k => $v%}
                <option value="{%$v%}" {%if !is_null(${%$name%}) &&$v == ${%$name%}%}selected=true{%/if%}>{%$k%}</option>
                {%/foreach%}
            </select>
        {%/foreach%}
        {%script%}
            require('manage:widget/btn-action/select.js')
        {%/script%}
        {%foreach $head_search as $name%}
            <input type="TEXT" class="right-content-search-input search-input" name="{%$name%}" value="{%${%$name%}%}" placeholder='{%$ar->getAttributeLabel($name)%}'>
        {%/foreach%}
        <!--<input type="BUTTON" class="right-content-search-btn" value="搜索"></input>-->
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='搜索' class='blue' action='search'%}
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='新增' class='green' action='add'%}
    </div>
    {%/block%}
    {%block name="right-content-table"%}
    <div class="right-table-wrap">
        <div class="right-table-header {%$class%}" for="">{%$nav%}</div>
        <table class="right-content-table" border=2>
            <thead>
                <tr>
                    {%assign var='index' value=1%}
                    <th index={%$index%}>#</th>
                    {%assign var="str_data" value=''%}
                    {%foreach $head as $k=>$v%}
                        {%if is_array($v) %}
                            {%if !empty($v['extra'])%}
                                {%foreach $v['extra'] as $k1=>$extra %}
                                    {%$str_data = "$str_data $k1=$extra"%}
                                {%/foreach%}
                            {%/if%}
                            {%$v = $ar->getAttributeLabel($k)%} 
                        {%/if%}
                        {%$index = $index+1%}
                        <th index={%$index%} {%$str_data%}>{%$v%}</th>
                    {%/foreach%}
                    {%$index = $index+1%}
                    <th index={%$index%}>操作</th>
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
            {%foreach $data as $dataV%}
            <tr {%if !is_null($dataV[$id])%}data-{%$id%}= "{%$dataV[$id]%}"{%else%}class="tr-empty"{%/if%}>
                <form action="" class="t-form" enctype="multipart/form-data" >
                    <td>{%$dataV[$id]%}<input name="{%$id%}" class="id" type="hidden" value="{%$dataV[$id]%}"  ></td>
                {%foreach $head as $headK=>$headV%}
                    {%assign var="name" value=$headK%}
                    {%assign var="value" value=$dataV[$name]%}
                    {%assign var="org_value" value=$value%}
                    {%if is_array($headV)%}
                        {%assign var="type" value=$headV.type%}
                        {%assign var="input_type" value=$headV.input_type%}
                        {%assign var="extra" value=$headV.extra%}
                        {%assign var="option" value=$headV.option%}
                        <!-- input类 -->
                        {%if $type == 'input'%}
                            {%$value = "<input name='$name' value='$value' type='$input_type'>"%}
                            <!-- 子类image -->
                            {%if $input_type == 'image' %}
                                {%$value = "<img src='$org_value' class='input-img' />"%}
                                {%$value = "$value<input class='img-input' name='$name' value='$org_value' type='file' />"%}
                            <!-- 子类radio -->
                            {%elseif $input_type == 'radio'%}
                                {%$value = ""%}
                                {%foreach $option as $optionK => $optionV%}
                                    {%if $dataV[$name] == $optionK%}
                                        {%$value ="$value <input name=$name value=$optionK checked=true >"%}
                                    {%else%}
                                        {%$value ="$value <input name=$name value=$optionK >"%}
                                    {%/if%}
                                    {%$value ="$value <span>$optionV</span>"%}
                                {%/foreach%}
                            <!-- 子类checkbox -->
                            {%elseif $input_type == 'checkbox'%}
                                {%$value = ""%}
                                {%foreach $option as $optionK => $optionV%}
                                    {%if $dataV[$name] == $optionK%}
                                        {%$value ="$value <input name='$name[]' value=$optionK checked=true >"%}
                                    {%else%}
                                        {%$value ="$value <input name='$name[]' value=$optionK >"%}
                                    {%/if%}
                                    {%$value ="$value <span>$optionV</span>"%}
                                {%/foreach%}
                            {%/if%}
                        <!-- textarea类 -->
                        {%elseif $type == 'textarea'%}
                        {%$value = "<div class='table-textarea-wrap'>$value<textarea name=$name>$value</textarea></div>"%}
                        <!-- select类 -->
                        {%elseif $type == 'select'%}
                            {%assign var="str_option" value=""%}
                            {%foreach $option as $optionK => $optionV%}
                                {%if $optionV == $value%}
                                    {%$str_option ="$str_option <option value=$optionV selected=true>$optionK</option>"%}
                                {%else%}
                                    {%$str_option ="$str_option <option value=$optionV>$optionK</option>"%}
                                {%/if%}
                            {%/foreach%}
                            {%$value = "<select name=$name>$str_option</select>"%}
                        {%elseif $type == 'a'%}
                            {%assign var="a_prefix" value=$headV.a_prefix%}
                            {%assign var="a_target" value=$headV.target%}
                            {%$value = "<a href=$a_prefix$value target='$a_target' >$value</a>"%}
                        {%elseif $type == 'img'%}
                            {%$value = "<img src=$value >"%}
                        {%/if%}
                    {%else%}
                        {%$value = "<input name='$name' type='text'  value='$value'>"%}
                    {%/if%}
                    <td name="{%$name%}" >{%$value|escape:none%}</td>
                {%/foreach%}

                <td class="btn-action-list">
                    <div class="btn-action-contain cf">
                    {%block name="btn-action-list"%}
                        {%widget name='manage:widget/btn-action/btn-action.tpl' text='提交' class='orange' ajax=$action['save'] action='save'%}
                        {%widget name='manage:widget/btn-action/btn-action.tpl' text='删除' class='red' href=$action['del'] action='del'%}
                        {%block name="btn-action-extra"%}
                        {%/block%}
                    {%/block%}
                    </div> 
                </td>
                </form> 
            </tr>
            {%/foreach%}
            </tbody>
        </table>
        {%widget name="manage:widget/pagger/pagger.tpl"%}
    </div> 
    {%/block%}
</div> 
{%/block%}

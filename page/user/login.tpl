{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
{%/block%}
{%block name="right-content-table"%}
<div class="login-wrap">
    <form class="login-form" action="/site/login" method="post">
        {%if !empty($message) || !empty($data)%}
        <li class="login-form-item error-contain">
            {%(empty($message))?json_encode($data,256):$message%}
        </li>
        {%/if%}
        <li class="login-form-item">
        <select class="right-content-input right-content-input-short" name="mobile_zone" id="login-country-code" onchange="$('input[type=text],input[type=password]').val('');">
            {%foreach $country_code as $optionObj%}
            <option value="{%$optionObj.code%}" {%if $optionObj.code == $country_code%}selected=true{%/if%}>{%$optionObj.country%}&nbsp;+{%$optionObj.code%}</option>
            {%/foreach%}
        </select>
            <input class="right-content-input" type="text" name='mobile' value="{%$mobile%}" placeholder="手机号">
        </li>
        <li class="login-form-item">
            <label class="right-content-label" for="">密码:</label>
            <input class="right-content-input" type="password" name='password' value="{%$password%}">
        </li>
        <li class="login-form-item">
            <pre><label class="right-content-label" for=""> </label><input class="action-btn blue" type="submit" value="登录" onfocus=blur()><input class="action-btn red" type="reset" value="重置" onfocus=blur()></pre> 
            {%widget name="manage:widget/btn-action/btn-action.tpl" style='display:none;'%}
        </li>
        
    </form>
</div> 
{%/block%}

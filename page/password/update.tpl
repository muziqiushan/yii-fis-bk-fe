{%extends file="manage/page/content/content.tpl"%}

{%block name="right-content-head3"%}
{%/block%}
{%block name="right-content-table"%}
<form class="right-content-list parent-dom cf" enctype="multipart/form-data"
method="post" action="">
    <li class="right-content-item">
        <label class="right-content-label" for="">旧密码:</label>
        <input class="right-content-input" type="password" name='oldpassword' value="{%$ad_name%}">
        <input class="right-content-errmsg" type="input" name='errmsg' disabled="disabled" value="">
    </li>
    <li class="right-content-item">
        <label class="right-content-label" for="">新密码:</label>
        <input class="right-content-input" type="password" name='newpassword' value="{%$ad_name%}">
        <input class="right-content-errmsg" type="input" name='errmsg' disabled="disabled" value="">
    </li>
    <li class="right-content-item">
        <label class="right-content-label" for="">重复码:</label>
        <input class="right-content-input" type="password" name='newpassword1' value="{%$ad_name%}">
        <input class="right-content-errmsg" type="input" disabled="disabled" name='errmsg' value="">
    </li>
    <li class="right-content-item">
        <pre><label class="right-content-label" for="" style="line-height: 1em;"> </label><input id="toggle-passwd" class="checkbox" type="checkbox" onchange="$('.right-content-input').attr('type',this.checked ? 'text' : 'password');"><label class="toggle-passwd-label" for="toggle-passwd">显示/隐藏密码</label></pre> 
    </li>
    <li class="right-content-item">
        <pre><label class="right-content-label" for=""> </label> <a class="action-btn blue action-btn-passwd" href="/user/set-passwd">保存</a><input class="action-btn red" type="reset" value="取消" onfocus=blur()> </pre> 
    </li>
        {%widget name="manage:widget/btn-action/btn-action.tpl" style='display:none;'%}
</form>
{%/block%}

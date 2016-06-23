{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
{%/block%}
{%block name="right-content-table"%}
<div class="login-wrap">
    <form class="login-form" action="/qinfenxiang/manage/user_login" method="post">
        <li class="login-form-item">
            您的权限不够，请点击重新登录/取消
        </li>
        <li class="login-form-item">
            <pre><label class="right-content-label" for=""> </label> 
        <input class="action-btn" type="submit" value="登陆"
onfocus=blur()><a class="action-btn red" onclick="location.href=document.referrer;">取消</a>
{%widget name="manage:widget/btn-action/btn-action.tpl" style="display:none;"%} 
            </pre> 
        </li>
    </form> 
</div> 
{%/block%}

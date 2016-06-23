{%extends file="manage/page/content/content.tpl"%}
{%block name="btn-action-list"%}
    <span>
<a class="action-btn action-btn-flip red"
    href="/user/freeze" {%if $v1.status != 0%}style="display:none;"{%/if%}>冻结</a>
<a class="action-btn action-btn-flip red"
    href="/user/recover" {%if $v1.status != 2%}style="display:none;"{%/if%}>恢复</a>
    </span>
    <span>
<a class="action-btn action-btn-flip blue"
    href="/user/pass-hug" {%if $v1.is_hug != 1%}style="display:none;"{%/if%}>通过hug申请</a>
<a class="action-btn action-btn-flip blue"
    href="/user/cancel-hug" {%if $v1.is_hug != 2%}style="display:none;"{%/if%}>取消hug申请</a>
    </span>
{%/block%}

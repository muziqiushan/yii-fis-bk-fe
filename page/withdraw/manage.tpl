{%extends file="manage/page/content/content.tpl"%}
{%block name="btn-action-list"%}
{%if $v1.status == 1%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='审核通过' class='red'
    href='/withdraw/pass-withdraw' action='ajax-refresh'%}
{%elseif $v1.status == 2%}
    审核通过
{%else if $v1.status == 3%}
    打款中
{%else if $v1.status == 4%}
    打款成功
{%/if%}
{%/block%}

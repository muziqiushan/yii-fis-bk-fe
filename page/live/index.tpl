{%extends file="manage/page/content-v2/content.tpl"%}
{%block name="btn-action-extra"%}
    {%if $dataV['status'] == '直播中'%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='终止视频' class='gray' href='/live/terminate' action='ajax-refresh' %}
    {%/if%}
{%/block%}

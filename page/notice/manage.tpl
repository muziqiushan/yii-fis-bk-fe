{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
{%/block%}

{%block name="right-content-table"%}
<textarea id="" class="notice-content" name="" cols="30" rows="10">{%$data%}</textarea>
<ul class="action-btn-list">
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='保存' class='blue' action='save' href="/qinfenxiang/notice/set"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='取消' class='red' action='open'%}
</ul>
{%/block%}

{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        <input type="TEXT" class="right-content-search-input search-input" name="{%$name%}" value="{%$region_name%}" placeholder="{%Yii::t('app', $name)%}">
        <!--<input type="BUTTON" class="right-content-search-btn" value="搜索"></input>-->
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='搜索地区' class='blue' action='search'%}
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='新增' class='green'
action='add'%}
    </div>
{%/block%}
{%block name="btn-action-list"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='修改' class='orange' href='/city/save' action='mod'%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='删除' class='red' href='/city/delete' action='del'%}
{%/block%}

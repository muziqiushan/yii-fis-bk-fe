{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        <input type="TEXT" class="right-content-search-input search-input" name="{%$name%}" value="{%$tag%}" placeholder="{%Yii::t('app', $name)%}">
        <!--<input type="BUTTON" class="right-content-search-btn" value="搜索"></input>-->
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='搜索' class='blue' action='search'%}
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='新增' class='green' action='add'%}
        {%widget name='manage:widget/btn-action/select.tpl' select_name='if_hot' action='select' select_data=['非热门','热门'] value=$if_hot option_all_txt='全部标签'%}
    </div>
{%/block%}
{%block name="btn-action-list"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='修改标签' class='orange' href='/tag/save' action='mod'%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='删除' class='red' href='/tag/delete' action='del'%}
{%/block%}

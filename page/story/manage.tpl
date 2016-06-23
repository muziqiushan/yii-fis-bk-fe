{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        <input type="TEXT" class="right-content-search-input search-input" name="{%$name%}" value="">
        <!--<input type="BUTTON" class="right-content-search-btn" value="搜索"></input>-->
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='搜索' class='blue' action='search'%}
        <div style="float:left;width:100%">
        <a class='green action-btn'
style='width:30%;height:40px;line-height:40px;margin: 10px 10px 10px 0;' action='open'
href='/qinfenxiang/manage/ad_add?ad_type=小&nav=广告管理'>+小广告</a>
        <a class='purple action-btn'
style='width:30%;height:40px;line-height:40px;margin: 10px 10px 10px 0;' action='open'
href='/qinfenxiang/manage/ad_add?ad_type=大&nav=广告管理'>+大广告</a>
        </div>
    </div>
{%/block%}

{%block name="btn-action-list"%}
{%widget name='manage:widget/btn-action/btn-action.tpl' text='修改' class='blue'
href='/qinfenxiang/manage/ad_add' action='open'%}
{%widget name='manage:widget/btn-action/btn-action.tpl' text='删除' class='red'
href='/qinfenxiang/ad/ajax_del' action='del'%}
{%/block%}

{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        <input type="TEXT" class="right-content-search-input search-input" name="{%$name%}" value="{%$username%}" placeholder="用户名">
        <input type="TEXT" class="right-content-search-input search-input" name="uid" value="{%$uid%}" placeholder="用户id">
        <input type="TEXT" class="right-content-search-input search-input" name="mobile" value="{%$mobile%}" placeholder="手机号">
        <!--<input type="BUTTON" class="right-content-search-btn" value="搜索"></input>-->
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='搜索' class='blue' action='search'%}
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='新增' class='green' action='add'%}
        {%widget name='manage:widget/btn-action/select.tpl' select_name='is_hug' action='select'
        select_data=['不是hug','申请hug中','审核通过'] value=$is_hug option_all_txt='全部状态'%}
    </div>
{%/block%}
{%block name="btn-action-list"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='修改用户' class='orange' href='/user/save' action='mod'%}
    <span>
<a class="action-btn action-btn-flip red"
    href="/user/freeze" {%if $v1.status != 0%}style="display:none;"{%/if%}>冻结</a>
<a class="action-btn action-btn-flip red"
    href="/user/recover" {%if $v1.status != 2%}style="display:none;"{%/if%}>恢复</a>
    </span>
    <span>
<a target="_blank" class="action-btn purple"
    href="http://www.mr-hug.com/product/about?id={%$v1.uid%}">查看详情</a>
    </span>
    <span>
<a class="action-btn action-btn-flip blue"
    href="/user/pass-hug" {%if $v1.is_hug != 1%}style="display:none;"{%/if%}>通过hug申请</a>
<a class="action-btn action-btn-flip green"
    href="/user/cancel-hug" {%if $v1.is_hug != 2%}style="display:none;"{%/if%}>取消hug资格</a>
    </span>
{%/block%}

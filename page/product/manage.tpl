{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        <input type="TEXT" class="right-content-search-input search-input" name="{%$name%}" value="{%$main_title%}" placeholder='主标题'>
        <input type="TEXT" class="right-content-search-input search-input" name="username" value="{%$username%}" placeholder='用户名'>
        <input type="TEXT" class="right-content-search-input search-input" name="pid" value="{%$pid%}" placeholder='产品id'>
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='搜索' class='blue' action='search'%}
        {%widget name='manage:widget/btn-action/select.tpl' select_name='status' action='select' select_data=['已保存','待审核','审核通过','审核驳回'] value=$status option_all_txt='全部状态'%}
    </div>
{%/block%}
{%block name="btn-action-list"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='查看详情' class='blue' href='http://www.mr-hug.com/product/view' action='open' target="_blank"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='查看订单' class='purple' href='/booking/index?nav=订单管理' action='open' target="_blank"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='产品修改' class='orange' href='/product/create?nav=产品发布' action='open' target="_blank"%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='删除产品' class='red' href='/product/delete' action='del'%}
{%if $v1.status == 0%}
    <!-- <div>已保存待审核</div>     -->
{%elseif $v1.status == 1%}
    <!-- <div>待审核</div>     -->
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='通过' class='green' href='/product/change-status?status=2' action='ajax-refresh'%}
    {%widget name='manage:widget/btn-action/btn-action-reject.tpl' text='驳回' class='red' href='/product/change-status?status=3'%}
<!--
  <div class="action-btn action-btn-reject red" href="/qinfenxiang/manage/ajax_reject">驳回
      <div class="reject-reason-wrap">
          <div class="reject-reason-triangle"></div>
          <input class="reject-reason-input" name="reject_reason" type=""
  placeholder="驳回理由">
      </div>
  </div>
-->
{%else if $v1.status == 2%}
    {%widget name='manage:widget/btn-action/btn-action-reject.tpl' text='驳回' href='/product/change-status?status=3'%}
{%else if $v1.status == 3%}
    {%widget name='manage:widget/btn-action/btn-action.tpl' text='通过' class='green' href='/product/change-status?status=2' action='ajax-refresh'%}
{%else%}
{%/if%}
{%/block%}

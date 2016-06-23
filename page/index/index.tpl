{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
{%require name="manage:static/common/underscore-min.js"%}
{%require name="manage:widget/btn-action/btn-action.css"%}
{%/block%}
{%block name="right-content-table"%}
<ul class="content-instrument-list cf">
    <li class="content-instrument-item blue">
        <div class="content-item-num">{%$review_count%}</div>
        <div class="content-item-label">待审核活动数</div>
        <a class="content-item-link"
href="/product/manage?nav=产品管理&status=1">查看详情</a>
    </li>
    <li class="content-instrument-item orange">
        <div class="content-item-num">{%$publish_count%}</div>
        <div class="content-item-label">共发布活动数</div>
        <a class="content-item-link" href="/product/manage?nav=产品管理">查看详情</a>
    </li>
    <li class="content-instrument-item green">
        <div class="content-item-num">{%$booking_count%}</div>
        <div class="content-item-label">订单数</div>
        <a class="content-item-link" href="/booking/index?nav=订单管理">查看详情</a>
    </li>
    <li class="content-instrument-item purple">
        <div class="content-item-num">{%$user_count%}</div>
        <div class="content-item-label">注册用户数</div>
        <a class="content-item-link" href="/user/index?nav=用户管理">查看详情</a>
    </li>
</ul>
<ul class="tab-list">
    <li class="tab-item cur">最新公告</li>
</ul>
<ul class="tab-content-list">
    <!--
      <li class="tab-content-item cf">
          <label for="">2015-12-21 09:18</label>
          <p>hug 网站全面上线</p>
      </li>
      <li class="tab-content-item cf">
          <label for="">2016-01-21 10:30</label>
          <p>hug app全面上线</p>
      </li>
    -->
</ul>
<a class='action-btn blue action-btn-add' href="#">新增</a>
{%literal%}
<script type="text/template" id="tpl-notice-item">
    <li class="tab-content-item cf" data-mid="<%-data.mid%>">
        <label for=""><%=data.created_at%></label>
        <a class="btn-del" href="#">x</a>
        <p><%=data.content%></p>
    </li>
</script>
{%/literal%}
{%/block%}

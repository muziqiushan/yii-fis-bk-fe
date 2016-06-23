{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='下载商品Excel' class='blue' action='download' href='download-product'%}
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='下载用户Excel' class='green' action='download' href='download-user'%}
    </div>
{%/block%}

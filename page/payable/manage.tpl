{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
    <div class="right-content-head right-content-head3">
        {%widget name='manage:widget/btn-action/btn-action.tpl' text='下载Excel' class='blue' action='download' href='/payable/download'%}
    </div>
{%/block%}
{%block name="btn-action-list"%}
    <span>
        <a class="action-btn action-btn-flip red" target="_blank"
            href="/payable/redownload?process_batch_no={%$v1.id%}">重新下载</a>
        <a class="action-btn action-btn-flip blue"
            href="/payable/confirm-batch-pay?process_batch_no={%$v1.id%}" {%if $v1.status != 0 %}style="display:none;"{%/if%}>付款成功</a>
    </span>
{%/block%}

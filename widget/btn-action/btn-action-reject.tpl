{%require name="manage:static/common/underscore-min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.css"%}
<div class="action-btn action-btn-reject {%($class)?$class:red%}" href="{%$href%}">{%($text)?$text:'驳回'%}
    <div class="reject-reason-wrap">
        <div class="reject-reason-triangle"></div>
        <input class="reject-reason-input" name="{%($input_name)?$input_name:'refuse_reason'%}" type=""
placeholder="驳回理由">
    </div>
</div>
{%script%}
    require('./btn-action-reject.js')
{%/script%}
{%literal%}
<script id="snip_refuse_dialog" type="text/template">
<ul id="refuse-dialog-wrap">
    <li class="refuse-dialog-contain cf">
        <label for="refuse-reason" class="refuse-reason-label">拒绝理由</label>
        <textarea id="refuse-reason" name="refuse_reason" cols="30" rows="10"></textarea>
    </li> 
    <li class="refuse-dialog-contain cf">
        <a class="action-btn refuse-confirm green" href="">确认</a>
        <a class="action-btn refuse-cancel red" href="">取消</a>
    </li> 
</ul>
     
</script>
{%/literal%}

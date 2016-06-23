{%extends file="manage/page/content/content.tpl"%}
{%block name="right-content-head3"%}
{%require name="manage:static/common/underscore-min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.js"%}
{%require name="manage:static/common/jquery/plugin/jquery-ui-1.11.4.custom/jquery-ui.min.css"%}
{%require name="manage:static/common/ckeditor/ckeditor.js"%}
{%require name="manage:widget/btn-action/btn-action.css"%}
{%/block%}
{%block name="right-content-table"%}
<form enctype="multipart/form-data" class="content-outer-wrap" method="POST" action="/static/save">
    <div class="detail-paragraph-contain">
        {%if empty($abouts)%}
        <div class="detail-paragraph cf" data-last_index=1>
            <!-- 索引input -->
            <label>序号:</label>
            <input class="detail-index" name="detail[1][index]" value="1" readonly=true>
            <span>/20</span>
            <a class="detail-btn detail-btn-del" href="javascript:void(0)">删除</a>
            <hr/>
            <div class="detail-contain cf">
                <label class="menu-label" for="#detail-index">菜单名称:</label>
                <input class="menu-input" name="detail[1][key]" value="" placeholder="菜单名称">
            </div> 
            <div class="detail-contain cf">
                <textarea name="detail[1][value]" id="editor1" rows="10" cols="80" class="detail-desc">
                </textarea>
            </div>
        </div>
        {%else%}
        {%foreach $abouts as $k=>$v %}
        <div class="detail-paragraph cf" {%if $k == (count($abouts)-1)%}data-last_index={%$v.index%}{%/if%}>
            <!-- 索引input -->
            <span>序号:</span>
            <input class="detail-index" name="detail[{%$k%}][index]" value="{%$v.index%}" readonly=true>
            <span>/20</span>
            <a class="detail-btn detail-btn-del" href="javascript:void(0)">删除</a>
            <div class="detail-contain cf">
                <label class="menu-label" for="#detail-index">菜单名称:</label>
                <input class="menu-input" name="detail[{%$k%}][key]" value="{%$v.key%}"  placeholder="菜单名称">
            </div> 
            <div class="detail-contain cf">
                <textarea name="detail[{%$k%}][value]" id="editor{%$k%}" rows="10" cols="80"  class="detail-desc">
                    {%$v.value%}
                </textarea>
            </div>
        </div>
        {%/foreach%}
        {%/if%}
    </div> 
    <a class="action-btn detail-btn-add blue" href="javascript:void(0)">+新增静态页(<i class="cur-detail-num">{%(count($abouts))?(count($abouts)):1%}</i>/20)</a>
    <input class="action-btn btn-save green" type="submit"  value="保存" >
</form>

{%/block%}

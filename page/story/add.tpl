{%extends file="manage/page/content/content.tpl"%}

{%block name="assign-nav"%}
{%require name="manage:widget/bootstrap/bootstrap.css"%}
{%if !empty($story_id)%}
{%assign var="sub_nav" value="修改故事"%}
{%else%}
{%assign var="sub_nav" value="新建故事"%}
{%/if%}
{%/block%}

{%block name="right-content-head3"%}
{%/block%}
{%block name="right-content-table"%}
<form class="right-content-list parent-dom cf" enctype="multipart/form-data"
method="post" action="/story/save">
    <li class="right-content-item">
        <label class="right-content-label" for="">故事名</label>
        <input class="right-content-input" type="hidden" name='story_id' value="{%$story_id%}">
        <input class="right-content-input" type="input" name='main_title' value="{%$main_title%}">
    </li>
    <li class="right-content-item">
        <label class="right-content-label" for="">封面图</label>
        <input class="right-content-input right-content-file" type="file" name='surface_url' value="{%$surface_url%}">
    </li>
    <li class="right-content-item">
        <div class="right-content-file-img-wrap">
            <img class="right-content-file-img" src="{%$surface_url%}" width="100%" alt="">
            <div class="play-box" {%if empty($surface_url)%}style="display:none;"{%/if%}>
                <span class="glyphicon glyphicon-play" aria-hidden="true"></span>
            </div>
        </div> 
    </li> 
    <li class="right-content-item">
        <label class="right-content-label" for="">视频地址</label>
        <input class="right-content-input" type="input" name='video_url' value="{%$video_url%}">
    </li>
    <li class="right-content-item">
        <pre><label class="right-content-label" for=""> </label> 
        <input class="action-btn blue" type="submit" value="保存" onfocus=blur()><input class="action-btn red action-btn-reset" type="reset" value="重置" onfocus=blur()>
        </pre> 
        {%widget name="manage:widget/btn-action/btn-action.tpl" style='display:none;'%}
         
    </li>
</form>


{%/block%}

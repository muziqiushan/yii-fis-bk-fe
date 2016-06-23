<!DOCTYPE html>
{%html framework="manage:static/common/modjs/mod.js"%}
{%head%}
    {%$site_name="Mr-hug管理后台"%}
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"> 
    <title>{%block name='title'%}{%$site_name%}{%/block%}</title>
    <meta name="description" content="{%block name='description'%}{%$site_name%}{%/block%}">
    <meta name="keywords" content="{%block name='keywords'%}{%$site_name%}{%/block%}">
    <!-- {%require name="manage:static/common/jquery/jquery.js"%} -->
    {%require name="manage:static/common/jquery/plugin/jquery.removeAttributes.js"%}
    {%block name="head_static"%}
    {%assign var="base_uri" value="/qinfenxiang/manage/"%}
    {%/block%}
{%/head%}
{%body class="cf"%}
    {%block name="header"%}
        {%widget name="manage:widget/header/header.tpl"%}
    {%/block%}

    {%block name="main"%}
    <div class="main">
        <div class="left-nav-contain">
        {%block name="left-nav"%}
            {%widget name="manage:widget/left-nav/left-nav.tpl"%}
        {%/block%}
        </div>
        <div class="right-content-contain">
        {%block name="right-main"%}
            <!--{%widget name="manage:widget/right-content/right-content.tpl" %}-->
        {%/block%}
        </div>
    </div>
    {%/block%}

    {%block name="footer"%}
        {%widget name="manage:widget/footer/footer.tpl"%}
    {%/block%}
{%/body%}
{%/html%}

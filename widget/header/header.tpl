<header>
    <span class="header-logo"></span>
    <a class="header-link" href="/" target="_blank">
        Mr-hug
    </a>
    <span class="sep ">|</span>
    <span class="header-title">管理后台</span>
    <a class="header-link right" href="/site/logout" >
        退出
    </a>
    <span class="sep right">|</span>
    {%if !empty($user.username)%}<span class="header-username right">{%$user.username%}({%if $user.role == 99%}超级管理员{%else%}普通用户{%/if%})</span>{%/if%}
<!--
      ({%if $manage.permission == 1%}编辑{%elseif $manage.permission ==
  2%}管理员{%elseif $manage.permission == 3%}超级管理员{%/if%})
-->
</header>
{%script%}
require.async("/widget/header/header.js");
{%/script%}

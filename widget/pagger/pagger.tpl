{%if $meta.pageCount>1 %}
<ul class="right-content-manager-footer-pagger cf total_page_num={%$meta.pageCount%}">
    {%if $meta.currentPage != 1%}
    <li class="right-content-manager-footer-pagger-item footer-pageno first" data-page=1>首页</li>
    <li class="right-content-manager-footer-pagger-item footer-pageno prev">上一页</li>
    {%/if%}
    {%for $i=1;$i<=$meta.pageCount;$i++%}
        <li class="right-content-manager-footer-pagger-item footer-pageno
        {%if $i==$meta.currentPage%}manager-footer-pagger-item-cur{%/if%}" data-page={%$i%}>{%$i%}</li>
    {%/for%}
    {%if $meta.currentPage != $meta.pageCount%}
    <li class="right-content-manager-footer-pagger-item footer-pageno next">下一页</li>
    <li class="right-content-manager-footer-pagger-item footer-pageno last" data-page={%$meta.pageCount%}>末页</li>
    {%/if%}
</ul>
{%script%}
    require('./pagger.js');
{%/script%}
{%/if%}

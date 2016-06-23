{%if !empty($select_data)%}
<select id="" name="{%$select_name%}" class="action-btn action-btn-select"  style="{%$style%}">
    {%if !empty($option_all_txt)%}
        <option value="">{%$option_all_txt%}</option>
    {%/if%}
    {%foreach $select_data as $k => $v%}
    <option value="{%$k%}" {%if !is_null($value) && $k == $value%}selected=true{%/if%}>{%$v%}</option>
    {%/foreach%}
</select>
{%/if%}
{%script%}
    require('./select.js')
{%/script%}

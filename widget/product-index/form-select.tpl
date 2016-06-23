{%literal%}
<script id="snip_select_form" type="text/template">
    <div class="select_form_mask_wrap">
        <div class="select_form_outer_wrap">
            <div class="select_form_inner_wrap cf">
                <a class="btn_close">x</a>
                <div class="left cf">
                    <h3>选择内容</h3>
                    <input class="input-border-round" type="text" placeholder="输入pid,然后按回车进行筛选;">
                    <select class="input-border-round" id="select_content_id" name="content_id" onchange="select_id_changed(this.value)">
                        <%if(data.length >0){%>
                            <%for(i=0;i<data.length;i++){%>
                                <option value="<%=data[i].content_id%>" <%if(id == data[i].content_id){%>selected = true<%}%>><%=data[i].content%></option>
                            <%}%>
                        <%}%>
                    </select>
                </div> 
                <div class="right cf"> 
                    <h3>预览窗</h3>
                    <ul class="select_form_preview_wrap"></ul>
                </div> 
                    <button id="preview-confirm-change" class="btn-confirm-change green">确认使用</button>
                    <button class="preview-btn-add green" href="#">新建</button>
            </div> 
        </div> 
    </div> 
</script>
<script id="snip_select_preview" type="text/template">
    <%for(var class_name in obj_class_map){%>
        <li class="cf">
        <label for=""><%-class_name%>:</label>
        <%if(!data[class_name]){
            continue;
        }%>
        <%switch(obj_class_map[class_name]){case 'text': case'id':%>
                <p class="<%-class_name%>"><%-data[class_name]%></p>
            <%break; case 'href':%>
                <%if(data[class_name].search('http://') <0){
                    data[class_name] = domain+data[class_name];
                }%>
                <a class="<%-class_name%>" href="<%-data[class_name]%>" target="_blank"><%-data[class_name]%></a>
            <%break;case 'src':%>
                <%if(data[class_name].search('http://') <0){
                    data[class_name] = domain+data[class_name];
                }%>
                <img class="<%-class_name%>" src="<%-data[class_name]%>" alt="<%-data[class_name]%>" target="_blank" />
            <%break;}%>
    <%}%>
</script>
{%/literal%}
{%script%}
    require("manage:widget/product-index/form-select.js");
{%/script%}

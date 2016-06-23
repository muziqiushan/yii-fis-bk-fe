var target_select_class = 'action-btn-mod';
var moded_select_class = 'btn-mod-submit';
$(document).delegate('.'+target_select_class,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $parent_dom = $(this).closest('tr');
    $.each($parent_dom.children('.modifiable'),function(index,item){
        var org_text = $(item).text();
        var name = $(item).attr('name');
        var type = 'text';
        // 选择(是/否)
        if(name.search('if_') === 0){
            var $dom_child = $(this).children();
            $dom_child.addClass('action-modify-input');
            return;
        }
        $(item).html('');
        var $input = $('<input>');
        // 图片
        if(name.search('_imgurl') > 0 || name.search('surface_url') >= 0){
            type = 'file';
            $input.addClass('img-input');
            $(item).append($('<img class="input-img"/>'));
        }
        // 时间
        if(name.search('_time') >0){
            $input.addClass('datetimepicker');
            $input.datetimepicker({format:'Y-m-d H:i:s'});
        }
        $input.addClass('action-modify-input');
        $input.attr({type:type,name:name,value:org_text});
        $(item).append($input);
        $input.focus();
    });
    $(this).data('org-text',$(this).text());
    $(this).text('提交');
    $(this).removeClass(target_select_class);
    $(this).addClass(moded_select_class);
})
/*
 * $('.right-content-table select').on('change',function(e){
 *     e.preventDefault();
 *     e.stopPropagation();
 *     $(this).removeClass(target_select_class);
 *     $(this).addClass(moded_select_class);
 *     $(this).addClass('action-modify-input');
 *     var href = $(this).closest('tr').find('.'+target_select_class).attr('href');
 *     $(this).attr('href',href);
 * })
 */
var assemble_data = function($target_dom){                                                    
    var arr_data = {};                                                             
    var arr_data = new FormData();
    $target_dom.each(function(index,item){                                         
        var name = $(item).attr('name');                                           
        var value = $(item).val();                                                 
        if($(item).attr('type') == 'file'){
            value = $(item)[0].files[0];
        }
        if(name && value){
            arr_data.append(name,value);
        }
        // arr_data[name] = value;                                                    
    })                                                                             
    var $parent_dom = $($target_dom).closest('tr');
    var parent_dom_data = $parent_dom.data();
    $.each(parent_dom_data,function(key,value){
        arr_data.append(key,value);
    })
    return arr_data;                                                               
}
$(document).delegate('.'+moded_select_class,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $target_dom = $('.action-modify-input');
    var arrData = assemble_data($target_dom);
    // $.extend(arrData,$parent_dom.data());
    var $that = $(this);
    $.ajax({
        url: $that.attr('href'),
        type: 'post',
        scriptCharset:'utf-8',
        processData: false,
        contentType: false,
        data: arrData,
        cache: false,
        success: function(data){
            if(data.code){
                var err_msg = '操作失败!';
                if(data.data){
                    err_msg +='失败原因:\n'+JSON.stringify(data.data);
                }
                else if(data.message){
                    err_msg +='失败原因:\n'+JSON.stringify(data.message);
                }
                alert(err_msg);
            }else{
                var extra_msg = '';
                if(data.message){
                    extra_msg = data.message
                }
                alert('操作成功！'+extra_msg);
                location.href = location.href;
            }
        },
        error: function (xhr, desc, err)
        {
            alert('操作失败,网络错误');
        }
    });
})

var target_class = 'action-btn-save';
var target_selector = '.action-btn-save';
/*
 * var assemble_data = function($target_dom){
 *     var arr_data = {};                                                             
 *     var arr_data = new FormData();
 *     $target_dom.each(function(index,item){                                         
 *         var name = $(item).attr('name');                                           
 *         var value = $(item).val();                                                 
 *         if($(item).attr('type') == 'file'){
 *             value = $(item)[0].files[0];
 *         }
 *         if(name && value){
 *             arr_data.append(name,value);
 *         }
 *         // arr_data[name] = value;                                                    
 *     })                                                                             
 *     var $parent_dom = $($target_dom).closest('tr');
 *     var parent_dom_data = $parent_dom.data();
 *     $.each(parent_dom_data,function(key,value){
 *         arr_data.append(key,value);
 *     })
 *     return arr_data;
 * }
 */
$(document).delegate(target_selector,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $that = $(this);
    var $tr = $that.closest('tr');
    var $form = $tr.find('form');
    if($form.length == 0){
        alert("提交失败，数据为空!");
        return;
    }
    var $id = $tr.find('.id');
    var data =  new FormData($form[0]);
    $.ajax({
        url: $that.attr('ajax'),
        type: 'post',
        scriptCharset:'utf-8',
        processData: false,
        contentType: false,
        dataType: 'json',
        data: data,
        mimeType: "multipart/form-data",
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
                if(data.data){
                    $id.val(data.data);
                }
                alert('操作成功！'+extra_msg);
                // location.href = location.href;
            }
        },
        error: function (xhr, desc, err)
        {
            alert('操作失败,网络错误');
        }
    });
})

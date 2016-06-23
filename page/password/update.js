var $target_select = '.action-btn-passwd';
var $target_dom = $($target_select);
var beforeSubmit = function(){
    var ret = true;
    $('.right-content-input').each(function(index,item){
        $(item).siblings('.right-content-errmsg').val('');
        if(!$(item).val())
        {
            $(item).focus();
            $(item).siblings('.right-content-errmsg').val('不能为空');
            ret = false;
        }
    })
    if(!ret){
        return ret;
    }
    var $new_password_input = $('input[name = newpassword]');
    var $repeat_password_input = $('input[name = newpassword1]');
    var new_password = $new_password_input.val();
    var repeat_password = $repeat_password_input.val();
    if(new_password != repeat_password) {
        $new_password_input.siblings('.right-content-errmsg').val('俩次输入不一致');
        $new_password_input.focus();
        return false;
    }
    return true;
}
var assemble_data = function(){
    var arr_data = {};
    $target_dom = $('.right-content-input');
    $target_dom.each(function(index,item){
        var name = $(item).attr('name');
        var value = $(item).val();
        arr_data[name] = value;
    })
    return arr_data;
}
$(document).delegate($target_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var ret = beforeSubmit();
    if(!ret){
        return;
    }
    var $that= $(this);
    $.ajax({
        url: $(this).attr('href'),
        type: 'post',
        scriptCharset:'utf-8',
        cache: false,
        data : assemble_data(),
        success: function(ret){
            if(ret.code){
                var err_msg = '操作失败!';
                if(ret.message){
                    err_msg +='失败原因:\n'+ret.message;
                }
                else{
                    err_msg +='失败原因:\n'+JSON.stringify(ret.data);
                }
                alert(err_msg);
            } else{
                alert('操作成功!');
                location.href = location.href;
            }
        }
    });
});

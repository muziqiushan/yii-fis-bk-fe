var $target_select = '.action-btn-ajax,.action-btn-ajax-refresh';
var $target_dom = $($target_select);
$(document).delegate($target_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $parent_dom = $(this).closest('tr,.parent-dom');
    var $that= $(this);
    var arrData = $parent_dom.data();
    if($(this).attr('input_selector')) {
        $($(this).attr('input_selector')).each(function(index,item){
            var key =$(item).attr('name');
            var value = $(item).val();
            arrData[key] = value;
        })
    }
    $.ajax({
        url: $(this).attr('href'),
        type: 'get',
        scriptCharset:'utf-8',
        data: arrData,
        cache: false,
        success: function(data){
            if(!data) {
                alert('操作失败，请重试！');
                return;
            }
            // 返回失败码
            if(data.code){
                var err_msg = '操作失败!';
                if(data.message){
                    err_msg +='失败原因:\n'+JSON.stringify(data.message);
                }
                else {
                    err_msg +='失败原因:\n'+JSON.stringify(data.data);
                }
                alert(err_msg);
            }
            // 成功
            else {
                if($target_dom.hasClass('action-btn-ajax-refresh')){
                    location.href=location.href;
                }
                if($that.attr('cb_url')) {
                    location.href=$that.attr('cb_url');
                }
                else{
                    alert('操作成功！');
                }
            }
        }
    });
})

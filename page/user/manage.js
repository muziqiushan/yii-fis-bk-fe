var $target_select = '.action-btn-flip';
var $target_dom = $($target_select);
$(document).delegate($target_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var that = $(this);
    var $parent_dom = $(this).closest('tr');
    $.ajax({
        url: $(this).attr('href'),
        type: 'get',
        data: $parent_dom.data(),
        cache: false,
        success: function(ret){
            if(!ret)
            {
                alert('操作失败，请重试！');
            }
            else{
                //操作dom
                that.hide();
                that.siblings($target_select).show();
            }
        }
    });
})


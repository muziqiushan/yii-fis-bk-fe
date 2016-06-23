var $del_select = '.action-btn-del';
var $del_dom = $($del_select);
$(document).delegate($del_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var r=confirm("亲,确认删除吗?不可逆哦!")
    if (r !=true)
    {
        return;
    }
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
                $parent_dom.remove();
            }
        }
    });
})


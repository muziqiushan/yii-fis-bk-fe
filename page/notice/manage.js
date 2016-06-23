var $target_select = '.action-btn-save';
$(document).delegate($target_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $parent_dom = $(this).closest('.parent-dom');
    var $that= $(this);
    var arrData = {'notice':$('.notice-content').val()};
    if($that.attr('href')){
        $.ajax({
            url: $(this).attr('href'),
            type: 'get',
            data: arrData,
            cache: false,
            success: function(ret){
                if(!ret) {
                    alert('操作失败，请重试！');
                }
                else {
                    alert('操作成功！');
                }
            }
        });
    }
})

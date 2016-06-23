var snip_notice_item = $('#tpl-notice-item').html();
var _snip_notice_item = _.template(snip_notice_item);
var $notice_list = $('.tab-content-list');
$.ajax({
    url: '/letter/get-system-notice',
    type: 'get',
    cache: false,
    success: function (data, status)
    {
        if(data.code == 0){
            $(data.data).each(function(index,item){
                var html_snip = _snip_notice_item({data:item});
                $notice_list.append(html_snip);

            })
        }
    }
});
$(document).on('click','.btn-del',function(e){
    e.preventDefault();
    $notice_item = $(this).closest('.tab-content-item');
    var mid = $notice_item.data('mid');
    $.ajax({
        url: '/letter/delete',
        type: 'get',
        cache: false,
        data: {mid:mid},
        success: function (data, status) {
            if(data.code){
                var err_msg = '操作失败!';
                if(data.message){
                    err_msg +='失败原因:\n'+JSON.stringify(data.message);
                }
                else{
                    err_msg +='失败原因:\n'+JSON.stringify(data.data);
                }
                alert(err_msg);
            } else{
                $notice_item.remove();
            }
        }
    });
});
$('.action-btn-add').on('click',function(e){
    e.preventDefault();
    var content=prompt("请输入要发布的系统消息!","")
    if (content!=null && content!="")
    {
        $.ajax({
            url: '/letter/create-system',
            type: 'get',
            cache: false,
            data: {content:content},
            success: function (data, status) {
                if(data.code){
                    var err_msg = '操作失败!';
                    if(data.message){
                        err_msg +='失败原因:\n'+JSON.stringify(data.message);
                    }
                    else{
                        err_msg +='失败原因:\n'+JSON.stringify(data.data);
                    }
                    alert(err_msg);
                } else{
                    var html_snip = _snip_notice_item(data);
                    $notice_list.prepend(html_snip);
                }
            }
        });
    }
});

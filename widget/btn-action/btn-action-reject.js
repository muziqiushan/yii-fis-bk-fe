$(document).delegate('.reject-reason-input','click',function(e){
    e.stopPropagation();
})
var $del_select = '.action-btn-reject';
var $del_dom = $($del_select);
var $cur_tr = null;
snip_refuse_dialog = _.template($('#snip_refuse_dialog').html())();
$('body').append(snip_refuse_dialog);
$(document).delegate($del_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    $cur_tr = $(this).closest('tr');
    $('#refuse-dialog-wrap').dialog({
        dialogClass: 'no-close',
        autoOpen:true,
        width:500,
        modal:true,
        draggable:true,
        resizable:false,
        position: { my: "center bottom", at: "center center", of: window }
    });
    return;
});
$(document).on('click','.refuse-confirm',function(e){
    e.preventDefault();
    var $reason_input = $('#refuse-reason');
    var reason_value = $reason_input.val();
    var reason_name = $reason_input.attr('name');
    var arrData = $cur_tr.data();
    if(!reason_value){
        $reason_input.focus();
        return;
    }
    arrData[reason_name] = reason_value;
    $.ajax({
        url: $('.action-btn-reject').attr('href'),
        type: 'get',
        data: arrData,
        cache: false,
        success: function(data){
            if(data.code)
            {
                var err_msg = '操作失败!';
                if(data.message){
                    err_msg +='原因:\n'+JSON.stringify(data.message);
                }
                else {
                    err_msg +='原因:\n'+JSON.stringify(data.data);
                }
                alert(err_msg);
            }
            else{
                location.href = location.href;
            }
        }
    });
});
$(document).on('click','.refuse-cancel',function(e){
    e.preventDefault();
    $( "#refuse-dialog-wrap" ).dialog( "close" )
});
    // var $reason_input = $(this).find('.reject-reason-input');


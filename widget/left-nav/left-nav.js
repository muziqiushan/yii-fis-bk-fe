$('.left-nav-search').on('keyup',function(e){
    if(e.keyCode == 13){
        e.preventDefault();
        var nav_input_txt = $(this).val();
        $('a.left-nav-item').each(function(index,item){
            var item_txt = $(item).text();
            var re = new RegExp(nav_input_txt,"g");
            if(Boolean(item_txt.match(re))){
                if(!$(item).hasClass('cur')){
                    $(item).trigger('click');
                }
                return false;
            }
        })
    }
})
$('a.left-nav-item').on('click',function(e){
    e.preventDefault();
    location.href = $(this).attr('href');
})
// $('.left-nav-search').focus();
$('.left-nav-upload').on('change',function(e){
    $.ajax({
        url: '/file/upload',
        type: 'POST',
        dataType: "JSON",
        data: new FormData(($(this).parent())[0]),
        processData: false,
        contentType: false,
        success: function (data, status)
        {
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
                // alert(data.data);
                prompt("Copy to clipboard: Ctrl+C, Enter", data.data);
            }
        },
        error: function (xhr, desc, err)
        {
            alert('操作失败,网络错误');
        }
    });        
    
})

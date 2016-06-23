var $target_select = '.action-btn-save';
var $target_dom = $($target_select);
var assemble_data = function(){
    var arr_data = {};
    arr_data['mid'] = $('.parent-dom').data('mid');
    arr_data['if_rec'] = 0;
    $target_dom = $('.checkbox:checked,.right-content-input');
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
    var $parent_dom = $(this).closest('.parent-dom');
    var $that= $(this);
    $.ajax({
        url: $(this).attr('href'),
        type: 'get',
        data: assemble_data(),
        cache: false,
        success: function(ret){
            if(!ret)
            {
                alert('操作失败，请重试！');
            }
            else{
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
//上传图片即时显示
$('.right-content-file').on('change',function(e){
    var $fileInput = $(e.currentTarget);
    var $file = $('.right-content-file-img');
    var fileInput = $fileInput[0];
    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $file.attr('src',e.target.result);
            $('.play-box').show();
        };
        reader.readAsDataURL(fileInput.files[0]);
    }
});
$('.action-btn-reset').on('click',function(e){
    var $fileInput = $('.right-content-file');
    var $file = $('.right-content-file-img');
    $file.attr('src',$fileInput.attr('value'));
    $('.play-box').hide();
});
$(document).on("submit", "form", function(event) {
    event.preventDefault();        
    $.ajax({
        url: $(this).attr("action"),
        type: $(this).attr("method"),
        dataType: "JSON",
        data: new FormData(this),
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
                alert('操作成功!');
            }
        },
        error: function (xhr, desc, err)
        {
            alert('操作失败,网络错误');
        }
    });        
});

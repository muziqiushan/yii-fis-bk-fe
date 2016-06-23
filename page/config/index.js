// 侧边栏
$('.detail-desc').each(function(index,item){
    var id = $(item).attr('id');
    CKEDITOR.replace(id);
});
$('.detail-btn-add').on('click',function(e){
    e.preventDefault();
    e.stopPropagation();
    if($('.detail-paragraph').length >= 20){
        alert('最多添加20个段落');return;
    }
    var $this = $(this);
    var $last_paragraph = $('[data-last_index]');
    var new_index = parseInt($last_paragraph.attr('data-last_index')) + 1;
    var $new_paragraph = $last_paragraph.clone(true);
    change_one_paragraph($new_paragraph,new_index);
    var ret = $('.detail-paragraph-contain').append($new_paragraph);
    if(ret){
        $last_paragraph.removeAttr('data-last_index');
        $new_paragraph.attr('data-last_index',new_index);
        // 更新新增按钮的数字
        $('.cur-detail-num').html($(".detail-paragraph").length);
        CKEDITOR.replace('editor'+new_index);
    }
});
// 修改新段落的各个域名
var change_one_paragraph = function($new_paragraph,new_index){
    // index 域
    $new_paragraph.find('.detail-index').attr(
        {
            name:'detail['+new_index+'][index]',
            value:$(".detail-paragraph").length+1
        }
    );
    // key 域
    $new_paragraph.find('.menu-input').attr('name','detail['+new_index+'][key]').val("");
    // value 域
    $new_paragraph.find('.detail-desc').attr({
        name:'detail['+new_index+'][value]',
        id:'editor'+new_index,
    }).val("");
        $new_paragraph.find('.cke').remove();
    }
$('.detail-btn-del').on('click',function(e){
    e.preventDefault();
    e.stopPropagation();
    if($('.detail-paragraph').length <= 1){
        alert('最少1个段落');return;
    }
    $this = $(this);
    $this_paragraph = $this.parent();
    var cur_index = $('[data-last_index]').attr('data-last_index');
    // var new_index = parseInt(cur_index) - 1;
    if($this_paragraph.attr('data-last_index')){
        /*
         * var cur_index = $this_paragraph.data('last_index');
         * new_index = cur_index-1;
         */
    }else{
        $this_paragraph.nextAll('.detail-paragraph').each(function(index,item){
            var $item = $(item);
            var new_index = parseInt($(item).children('.detail-index').val())-1;
            $(item).find('.detail-index').attr('value',new_index);
            // change_one_paragraph($(item),new_index);
        });
    }
    var ret = $this_paragraph.remove();
    $('.detail-paragraph').last().attr('data-last_index',cur_index);
    if(ret){
        $('.cur-detail-num').html($('.detail-paragraph').length);
    }
})
// 提交审核按钮
$('.btn-save').on('click',function(e){
    var cke_instances = CKEDITOR.instances;
    for(var key in cke_instances){
        $('#'+key).val(cke_instances[key]);
    }
})
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
            console.log(data);

        },
        error: function (xhr, desc, err)
        {

        }
    });        
});


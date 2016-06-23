// 侧边栏
$.extend({
    keys: function(obj){
        var a = [];
        $.each(obj, function(k){ a.push(k) });
        return a;
    }
})
$('.detail-desc').each(function(index,item){
    var id = $(item).attr('id');
    CKEDITOR.replace(id);
});
$('.right-content-tab-list-item').on('click',function(e){
    $('.right-content-div').hide();
    var cur_id = $(this).children('.right-content-tab-a').attr('data-target');
    $('#'+cur_id).show();
    $('.right-content-tab-list-item').removeClass('active');
    $(this).addClass('active');
})
$('.right-content-tab-list-item a').first().trigger('click');

//上传图片即时显示
$('.img-input').on('change',function(e){
    var $fileInput = $(e.currentTarget);
    var $img = $(this).siblings('.input-img');
    var fileInput = $fileInput[0];
    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $img.attr('src',e.target.result);
        };
        reader.readAsDataURL(fileInput.files[0]);
    }
});
// mock数据
var objDateTime = $('#quotas').val()||{};
if(objDateTime.length){
    objDateTime = JSON.parse(objDateTime);
}
// objDateTime = objDateTime || {'2016-01-01':{'07:00':10,'09:00':9},'2015-12-29':{'08:00':10,'09:00':9},'2015-12-30':{'09:00':9,'10:00':5}};
// var saveDateTime = objDateTime || {}
// var datelist = $.keys(objDateTime);
$('.datepicker').datepicker({
    dateFormat : 'yy年mm月dd日',
    altFormat: "yy-mm-dd",
    altField: "#datepicker-alt",
    minDate: 0,
    beforeShowDay: function(d) {
        // normalize the date for searching in array
        var dmy = "";
        dmy += d.getFullYear()+ "-";
        dmy += ("00" + (d.getMonth() + 1)).slice(-2) + "-";
        dmy += ("00" + d.getDate()).slice(-2) ;
        additional_class = "";
        if(objDateTime.hasOwnProperty(dmy)){
            additional_class = "datepicker-state-active";
        }
        // return [$.inArray(dmy, datelist) >= 0 ? true : false, additional_class];
        return [true, additional_class];
    },
    onSelect : function(ct,inst){
        $('.timepicker-wrap').show();
        // $i.inline = false;
        // This is the important line.
        //Setting this to false prevents the redraw.
        inst.inline = false;
        // 设置title
        $('.timepicker-title-date').html(ct);

        //The remainder of the function simply preserves the 
        //highlighting functionality without completely redrawing.

        //This removes any existing selection styling.
        /*
         * $(this).find(".ui-datepicker-calendar .ui-datepicker-current-day").removeClass("ui-datepicker-current-day").children().removeClass("ui-state-active");
         */

        //This finds the selected link and styles it accordingly.
        //You can probably change the selectors, depending on your layout.
        $(this).find(".ui-datepicker-calendar TBODY td").each(function(){
            if ( $(this).find('a').text() == inst.selectedDay && $(this).data('month') == inst.selectedMonth ) {
                // eg : 2015-09-23
                var dmy = $('#datepicker-alt').val();
                $currentDay = $(this);
                // 修改时间域
                var $timepicker_item = $('.timepicker-item').last().clone(true);
                $('.timepicker-item').remove();
                if(_.size(objDateTime[dmy])){
                    for(var i in objDateTime[dmy]){
                        $timepicker_item.children('.timepicker').val(i)
                        $('.time-btn-add').before($timepicker_item);
                        $timepicker_item = $timepicker_item.clone(true);
                    }
                }
                else{
                    $timepicker_item.val("");
                    $('.time-btn-add').before($timepicker_item);
                    $(".ui-state-active-empty").removeClass("ui-state-active-empty");
                    $(this).find('a').addClass("ui-state-active-empty");
                }
                // 修改样式
                $(".ui-datepicker-current-day").removeClass("ui-datepicker-current-day");
                $(this).addClass("ui-datepicker-current-day");
            }
            // }
        });
    }
});
$currentDay = $('.ui-datepicker-today');
// 点击今天
$currentDay&&$currentDay.trigger('click');
// 时间控件
$('.time-btn-add').on('click',function(e){
    e.preventDefault();
    if($('.timepicker-item').length >= 3){
        alert('一天最多选择3个时间');return;
    }
    var $new_timepicker_itme = $(this).prev().clone(true);
    // 置空value，显示为--:--
    $new_timepicker_itme.children('.timepicker').val("")
    $(this).before($new_timepicker_itme);
})
var save_time_change = function(){
    var cur_date = $('#datepicker-alt').val();
    objDateTime && (objDateTime[cur_date] = {});
    var obj = objDateTime[cur_date];
    // 获取最大配额
    var quota_max = $('#quota_max').val();
    $('.timepicker').each(function(index,item){
        var time = $(item).val();
        if(time.length >0){
            obj[time] = quota_max;
        }
    })
    if(_.size(obj)){
        $currentDay.addClass('datepicker-state-active');
    } else{
        $currentDay.removeClass('datepicker-state-active');
    }
    $('#quotas').val(JSON.stringify(objDateTime));
    resetRepeatWidget();
}
// 时间控件(需变更数据)
$('.time-btn-del').on('click',function(e){
    e.preventDefault();
    if($('.timepicker-item').length <= 1){
        $(this).siblings('.timepicker').val("");
    } else{
        $(this).closest('.timepicker-item').remove();
    }
    save_time_change();
})
// 时间控件(需变更数据)
$('.timepicker').on('change',function(e){
    save_time_change();
})
// 点击保存时间按钮 保存时间(注释掉即为及时保存)
/*
 * $('.time-btn-save').on('click',function(e){
 *     e.preventDefault();
 *     $('.timepicker-wrap').hide();
 *     // saveDateTime = objDateTime;
 *     $('#quotas').val(JSON.stringify(objDateTime));
 * })
 */
$(document).on('change','.region',function(e){
    $this = $(this);
    $this_parent =  $(this).parent();
    if($this.data('level') >= 3){
        return;
    }
    $.ajax({
        url:'/product/next-region',
        data:{id:$(this).val()},
        success:function(data){
            $this.nextAll().remove();
            if(data.data.length >0){
                var snip = _.template($('#region-next').html())(data);
                $this_parent.append(snip);
            }
        }
    });
})
$('input').on('focus',function(e){
    e.preventDefault();
    e.stopPropagation();
})
$('.detail-btn-add').on('click',function(e){
    e.preventDefault();
    e.stopPropagation();
    if($('.detail-paragraph').length >= 10){
        alert('最多添加10个段落');return;
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
    // img 域
    $new_paragraph.find('.detail-img').attr(
        {
            src:''
        }
    );
    // img-input 域
    $new_paragraph.find('.img-input').attr(
        {
            name:new_index,
            value:''
        }
    );
    // description 域
    $new_paragraph.find('.detail-desc').attr({
        name:'detail['+new_index+'][description]',
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
$('.btn-commit').on('click',function(e){
    $(this).closest('form').attr('action','/product/commit');
});
$('.btn-save').on('click',function(e){
    var cke_instances = CKEDITOR.instances;
    for(var key in cke_instances){
        $('#'+key).val(cke_instances[key]);
    }
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
                location.href = location.href;
            }
        },
        error: function (xhr, desc, err)
        {
            alert('操作失败,网络错误');
        }
    });
});
$('#hug,#hug_phone').on('change',function(e){
    var value = $(this).val();
    $('#hug,#hug_phone').val(value);
})
var resetRepeatWidget = function(){
    var $week_repeat = $('.week-repeat');
    // 显示每周重复复选框
    if(_.size(objDateTime[window.dmy])> 0){
        $week_repeat_i = $week_repeat.children('i');
        if($week_repeat_i.hasClass('glyphicon-ok')){
            $week_repeat_i.removeClass('glyphicon glyphicon-ok');
            $week_repeat_i.siblings('input').removeAttr('checked');
        }
        $week_repeat.show();
    } else {
        $week_repeat.hide();
    }
}


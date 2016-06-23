var snip_select_form = $('#snip_select_form').html();
var _snip_select_form = _.template(snip_select_form) 
var snip_select_preview = $('#snip_select_preview').html();
var _snip_select_preview = _.template(snip_select_preview) 
window.domain = 'http://mr-hug.com';
window.product_index_class_map = {};
window.product_index_content_id = 0;
window.$product_index_li = null;
window.$product_index_btn_confirm = null;
$('.btn-select').on('click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $li = $(this).closest('li');
    var content_type = $li.attr('content_type');
    var $children_dom = $li.find('[class]').not('div,span').not('.btn-select');
    window.product_index_class_map = {};
    window.$product_index_li = $li;
    window.product_index_content_id = $li.attr('content_id');
    var tmp_class_name = '';
    // 从dom中获取product_index_class_map
    product_index_class_map['content_id'] = 'id';
    $children_dom.each(function(index,item){
        switch(item.tagName){
            /*
             * case 'DIV':
             *     break;
             * case 'SPAN':
             *     break;
             */
            case 'H3':
            case 'P':
            case 'EM':
            tmp_class_name = $(item).attr('class');
            product_index_class_map[tmp_class_name] = 'text';
            break;
            case 'IMG':
            tmp_class_name = $(item).attr('class');
            product_index_class_map[tmp_class_name] = 'src';
            break;
            case 'A':
            tmp_class_name = $(item).attr('class');
            product_index_class_map[tmp_class_name] = 'href';
            break;
            default:
            break;
        }
    });
    //@todo 需要走网络请求
    var $cur_li = window.$product_index_li;
    // @hack arrow 区域产品模块 选取逻辑，加入category_id
    if($cur_li.hasClass('arrow-product')){
        var li_weight = $cur_li.attr('weight');
        var sibling_categorys = $('.arrow-category');
        var category_index = parseInt(li_weight/3);
        var $category_li = $(sibling_categorys[category_index]); 
        var category_id = $category_li.attr('content_id');
        if(!category_id){
            alert('请先选取所属的类型!');
            $category_li.focus();
            return;
        }
        $cur_li.attr('category_id',category_id);
    }
    var arrData = $cur_li.getAllAttr();
    $.ajax({
        url: '/product/id-list',
        type: 'post',
        data: arrData,
        cache: false,
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
                // var data = {data:[{content_id:1,content:'产品1'},{content_id:2,content:'产品2'},{content_id:3,content:'产品3'}]};
                // 可选id列表为空的情况
                if(data.data.length == 0){
                    alert('可选列表为空!请先新建产品/分类/故事/城市');
                } else {
                    data.id = window.product_index_content_id ;
                    var html_snip = _snip_select_form(data);
                    $('body').append(html_snip);
                    window.$product_index_btn_confirm = $('#preview-confirm-change');
                    var org_id_in_list = false;
                    $(data.data).each(function(index,item){
                        if(item.content_id == product_index_content_id){
                            org_id_in_list = true;
                            return;
                        }
                    })
                    var content_id = data.data[0].content_id;
                    if(org_id_in_list){
                        content_id = window.product_index_content_id;
                    }
                    get_preview_info(content_id);
                }
            }
        },
        error: function (xhr, desc, err)
        {
            alert('操作失败,网络错误');
        }
    });
})
function get_preview_info(content_id){
    window.$product_index_btn_confirm.hide(); 
    window.product_index_content_id = content_id;
    var $preview_wrap = $('.select_form_preview_wrap');
    //@todo 需要走网络请求
    var arrData = window.$product_index_li.getAllAttr();
    arrData.content_id = content_id;
    if($preview_wrap.length>0){
        $.ajax({
            url: '/product/preview',
            type: 'post',
            data: arrData,
            cache: false,
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
                    // var data = {data:{main_title:'产品1主标题',sub_title:'产品1副标题','detail_surface_url':'http://img0.bdstatic.com/img/image/shouye/mingxing1228.jpg','index_img_url':'/img//1452166514CxUetD.jpg','video_url':'http://v.youku.com/v_show/id_XMTg1ODQwNjMy.html?from=s1.8-3-3.1http://v.youku.com/v_show/id_XMTg1ODQwNjMy.html?from=s1.8-3-3.1'},obj_class_map:product_index_class_map,domain:'http://mr-hug.com'};
                    window.product_index_data = data.data;
                    data.domain = window.domain;
                    data.obj_class_map = window.product_index_class_map;
                    var html_snip = _snip_select_preview(data);
                    $preview_wrap.html(html_snip);
                    window.$product_index_btn_confirm.show(); 
                }
            },
            error: function (xhr, desc, err)
            {
                alert('操作失败,网络错误');
            }
        });
    }
}
window.select_id_changed = function(val){
    get_preview_info(val)
}
$('body').on('click','.btn_close',function(e){
    e.preventDefault();
    e.stopPropagation();
    $(this).closest('.select_form_mask_wrap').remove();
})
$('body').on('click','.btn-confirm-change',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $cur_li = window.$product_index_li;
    $cur_li.attr('content_id',window.product_index_content_id);
    var arrData = $cur_li.getAllAttr();
    arrData.layout_id = $cur_li.closest('[layout_id]').attr('layout_id'); 
    $.ajax({
        url: '/product/confirm-change',
        type: 'post',
        data: arrData,
        cache: false,
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
                $('.select_form_mask_wrap').remove();
                $cur_li.fadeOut(300,function(){ 
                    for(var class_name in window.product_index_class_map){
                        var $cur_dom = $cur_li.find("."+class_name);
                        var type = window.product_index_class_map[class_name];

                        switch(type){
                            case 'text':
                            $cur_dom.text(window.product_index_data[class_name]);
                            break;
                            case 'src':
                            $cur_dom.attr('src',window.product_index_data[class_name]);
                            break;
                            case 'href':
                            $cur_dom.attr('href',window.product_index_data[class_name]);
                            break;
                            default:
                            break;
                        }
                    }
                    if($cur_li.hasClass('arrow-category')){
                        $cur_li.attr('content_id',window.product_index_content_id);
                    }
                    $cur_li.fadeIn(300,function(){
                        $cur_li.removeAttr('style');
                    });
                });
            }
        },
        error: function (xhr, desc, err)
        {
            alert('操作失败,网络错误');
        }
    });
});
$('body').on('click','.preview-btn-add',function(e){
    var content_type = window.$cur_li.attr('content_type');
    var target_url = '';
    switch(content_type){
        // product
        case 1:
            break;
        // category
        case 2:
            break;
        // city
        case 3:
            break;
        // story
        case 4:
            var objData = $cur_li.getAllAttr();
            objData.layout_id = $cur_li.closest('[layout_id]').attr('layout_id');
            target_url = '/story/create?cb=1'+joinQuery(objData);
            window.open(target_url);
            break;
    }
    
})
var joinQuery = function(objParams) {
    if ($.isEmptyObject(objParams)) {
        return "";
    }
    var append = "";                                                               
    for (var i in objParams) {                                                     
        if (!objParams[i]) {                                                       
            continue;                                                              
        }                                                                          
        append = '&'+i+'='+objParams[i];                                           
    }                                                                              
    return append;                                                                 
}
$('body').on('keyup','.input-border-round',function(e){
    $input = $(this);
    // 触发上方选择框变化
    if(e.keyCode == 13){
        $('#select_content_id').val($input.val()).trigger('change');
    }
})

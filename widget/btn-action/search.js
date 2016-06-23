var $target_select = '.action-btn-search';
var $target_dom = $($target_select);
var splitQuery = function() {
    var querys = location.search,query={}, config = {};
    if (querys.length == 0) {
        return config;
    }
    querys = querys.substring(1).split("&");
    for (var i in querys) {
        if(!querys[i]) {
            continue;
        }
        query = querys[i].split("=");
        config[query[0]] = query[1];
    }
    return config;
};
var joinQuery = function(objParams) {
    if ($.isEmptyObject(objParams)) {
        return "";
    }
    var append = "";
    for (var i in objParams) {
        if (!objParams[i]) {
            continue;
        }
        append += (i+'='+objParams[i]+'&');
    }
    return append;
}
//对按钮旁边的input标签绑定事件
$(document).delegate('.search-input','keyup',function(e){
    if(e.keyCode == 13) {
        e.preventDefault();
        e.stopPropagation();
        $(this).siblings($target_select).click();
    }
})
$(document).delegate($target_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $parent_dom = $(this).closest('tr');
    var objParams = splitQuery();
    objParams = $.extend({},objParams,{pn:0});
    var brotherInput = $(this).prevAll('input');
    brotherInput.each(function(index,item){
        var name = $(item).attr('name');
        var value = $(item).val();
        objParams[name] = value;
    });
    var targetUri = location.pathname+'?'+joinQuery(objParams);
    location.href = targetUri;
});

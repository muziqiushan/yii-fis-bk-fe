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
$(document).delegate('.footer-pageno','click', function(e) {
    if ($(this).hasClass('manager-footer-pagger-item-cur')) {
        return false;
    }
    var curPagger = $('.manager-footer-pagger-item-cur');
    var page = curPagger.data('page');
    //调整样式
    $('.manager-footer-pagger-item-cur').  removeClass('manager-footer-pagger-item-cur');
    /*$(this).addClass('manager-footer-pagger-item-cur');*/
    if ($(this).hasClass('next')) {
        page++;
    }
    else if ($(this).hasClass('prev')) {
        page--;
    } else {
        page = $(this).data('page');
    }
    var objParams = splitQuery();
    objParams = $.extend({},objParams,{page:page});
    var targetUri = location.pathname+'?'+joinQuery(objParams);
    location.href= targetUri;
    /*$.ajax({*/
    /*url: targetUri,*/
    /*type: 'get',*/
    /*cache: false,*/
    /*data: objData,*/
    /*success: function(ret) {*/
    /*}*/
    /*})*/
})

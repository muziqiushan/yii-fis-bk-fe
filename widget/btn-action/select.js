var $target_select = '.action-btn-select';
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
$target_dom.on('change',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $parent_dom = $(this).closest('tr');
    var objParams = splitQuery();
    var thisInput = $(this);
    var name = thisInput.attr('name');
    var value = thisInput.val();
    objParams = $.extend({},objParams,{pn:0});
    objParams[name] = value;
    var targetUri = location.pathname+'?'+joinQuery(objParams);
    location.href = targetUri;
});

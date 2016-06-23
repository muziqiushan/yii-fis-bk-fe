var $target_select = '.action-btn-open';
var $target_dom = $($target_select);
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
$(document).delegate($target_select,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $parent_dom = $(this).closest('tr');
    var target = $(this).attr('target'); 
    var href =$(this).attr('href'); 
    if(!href) {
        href = location.href;
    }
    else{
        if(href.indexOf('?') <=0){
            href +='?';
        }
        href += joinQuery($parent_dom.data());
    }
    if(target.search('blank') >=0)
    {
        window.open(href);
    }
    else
    {
        location.href = href;
    }
});

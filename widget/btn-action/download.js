var target_select_class = '.action-btn-download';
$(document).delegate(target_select_class,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var href = $(this).attr('href');
    window.open(href)
})

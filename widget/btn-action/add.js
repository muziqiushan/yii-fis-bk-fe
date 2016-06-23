var target_select_class = '.action-btn-add';
$(document).delegate(target_select_class,'click',function(e){
    e.preventDefault();
    e.stopPropagation();
    var $parent_dom = $('tbody');
    var $parent_tr = $('.tr-empty').first();
    // var new_dom = $parent_tr.clone(true,true);
    // var $td_list = $parent_tr.find('td').clone(true,true);
    // var new_dom = $($tr_list.first()).clone(true,true);
    // var new_dom = $('<tr></tr>');
    /*
     * new_dom.children().each(function(index,item){
     *     if(!$(item).hasClass('btn-action-list'))
     *     {
     *         $(item).val('');
     *     }
     * })
     */
    // v2
    // $parent_dom.prepend(new_dom);
    $parent_dom.prepend($parent_tr);
    $parent_tr.removeClass('tr-empty');
    /*
     * new_dom.append($td_list);
     * new_dom.prepend($('<form></form>'));
     */
    // new_dom.removeAttributes();
    $parent_tr.find('.action-btn-mod').click();
})

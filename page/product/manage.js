$('[name=price_for_hug],[name=price_for_platform]').on('keyup',function(e){
    var $tr = $(this).parents('tr');
    var price_for_hug = +$tr.find('input[name=price_for_hug]').val();
    var price_for_platform = +$tr.find('input[name=price_for_platform]').val();;
    var total_price = (price_for_hug + price_for_platform).toFixed(2);
    $tr.find('[name=price_total]').text(total_price);
});

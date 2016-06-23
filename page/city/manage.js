$('[name=price_sale_profit],[name=price_cost_per]').on('keyup',function(e){
    var $tr = $(this).parents('tr');
    var price_per = +$tr.find('input[name=price_cost_per]').val();
    var profit = +$tr.find('input[name=price_sale_profit]').val();;
    var total_price = (price_per * (1+profit/100)).toFixed(2);
    $tr.find('[name=price_total]').text(total_price);
});

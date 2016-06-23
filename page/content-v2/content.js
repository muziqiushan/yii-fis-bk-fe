//上传图片即时显示
$(document).on('change','.img-input',function(e){
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
// sug
var $head = $('[sug]');
$head.each(function(index1,item1){
    var sug_index = $(item1).attr('index');
    $('tr').each(function(index,item){
        var sug_td = $(item).find('td').get(sug_index-1);
        var sug_source = $(item1).attr('sug');
        if(sug_td){
            $input = $(sug_td).children('input');
            // $(sug_td).on('keyup',sug_fun);
            $input.autocomplete({
                // source:availableTags
                source:sug_source,
                delay: 300
            })
        }
    })
});

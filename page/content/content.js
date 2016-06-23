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

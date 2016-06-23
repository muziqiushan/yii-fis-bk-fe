$.fn.removeAttributes = function(only, except) {
    if (only) {
        only = $.map(only, function(item) {
            return item.toString().toLowerCase();
        });
    };
    if (except) {
        except = $.map(except, function(item) {
            return item.toString().toLowerCase();
        });
        if (only) {
            only = $.grep(only, function(item, index) {
                return $.inArray(item, except) == -1;
            });
        };
    };
    return this.each(function() {
        var attributes;
        if(!only){
            attributes = $.map(this.attributes, function(item) {
                return item.name.toString().toLowerCase();
            });
             if (except) {
                attributes = $.grep(attributes, function(item, index) {
                    return $.inArray(item, except) == -1;
                });
            };
        } else {
            attributes = only;
        }      
        var handle = $(this);
        $.each(attributes, function(index, item) {
            handle.removeAttr(item);
        });
    });
};
$.fn.getAllAttr = function(){
    var attributes = {};
    $.each(this[0].attributes, function(i, attrib){
        attributes[attrib.name] = attrib.value;
    });
    return attributes;
};

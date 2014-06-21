$(document).ready ->

    $.fn.stars = -> 
        return $(this).each( -> 
            val = parseFloat($(this).html());
            val = Math.round(val * 4) / 4; 
            val = Math.round(val * 2) / 2; 
            size = Math.max(0, (Math.min(5, val))) * 16;
            $span = $('<span />').width(size);
            $(this).html($span);
        )
    
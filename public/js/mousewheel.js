$(function() { 

    $.fn.wheel = function (callback) {
        return this.each(function () {
            $(this).on('mousewheel DOMMouseScroll', function (e) {
                e.delta = null;
                if (e.originalEvent) {
                    if (e.originalEvent.deltaY) {e.delta = e.originalEvent.deltaY * -1;} //Chrome
                    else if (e.originalEvent.wheelDelta) {e.delta = e.originalEvent.wheelDelta;} //IE
                    else if (e.originalEvent.detail) {e.delta = e.originalEvent.detail * -60;} //Firefox
                }

                if (typeof callback == 'function') {
                    callback.call(this, e);
                }
            });
        });
    };

    //調整滾軸速度
    $('body').wheel(function (e) {
        e.preventDefault();
        var get_scroll_postion = getScrollOffsets();
        window.scrollTo(get_scroll_postion.x, get_scroll_postion.y - e.delta/4);
    });

    // Return the current scrollbar offsets as the x and y properties of an object
    function getScrollOffsets(w) {
        // Use the specified window or the current window if no argument
        w = w || window;

        // This works for all browsers except IE versions 8 and before
        if (w.pageXOffset != null) return {
            x: w.pageXOffset,
            y:w.pageYOffset
        };

        // For IE (or any browser) in Standards mode
        var d = w.document;
        if (document.compatMode == "CSS1Compat") {
            return {
                x:d.documentElement.scrollLeft,
                y:d.documentElement.scrollTop
            };
        }

        // For browsers in Quirks mode
        return { 
            x: d.body.scrollLeft,
            y: d.body.scrollTop
        }; 
    }

});

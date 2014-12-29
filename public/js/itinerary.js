/*$(document).ready(function(){
    $("#accordion").accordion({
      heightStyle: "content",
      active: false,
      beforeActivate: function(event, ui) {
         // The accordion believes a panel is being opened
        if (ui.newHeader[0]) {
            var currHeader  = ui.newHeader;
            var currContent = currHeader.next('.ui-accordion-content');
         // The accordion believes a panel is being closed
        } else {
            var currHeader  = ui.oldHeader;
            var currContent = currHeader.next('.ui-accordion-content');
        }
         // Since we've changed the default behavior, this detects the actual status
        var isPanelSelected = currHeader.attr('aria-selected') == 'true';

         // Toggle the panel's header
        currHeader.toggleClass('ui-corner-all',isPanelSelected).toggleClass('accordion-header-active ui-state-active ui-corner-top',!isPanelSelected).attr('aria-selected',((!isPanelSelected).toString()));

        // Toggle the panel's icon
        currHeader.children('.ui-icon').toggleClass('ui-icon-triangle-1-e',isPanelSelected).toggleClass('ui-icon-triangle-1-s',!isPanelSelected);

         // Toggle the panel's content
        currContent.toggleClass('accordion-content-active',!isPanelSelected)    
        if (isPanelSelected) { currContent.slideUp(); }  else { currContent.slideDown(); }

        return false; // Cancels the default action
      }
    });
  });*/

$(document).ready(function(){
  $('#accordion div p span').append('<img class="info" src="/images/eat.png">')  
  $('#accordion div p span').mouseover(function(){
    $(this).children('.info').show();
  }).mouseout(function(){
    $('.info').hide();
  })
})  

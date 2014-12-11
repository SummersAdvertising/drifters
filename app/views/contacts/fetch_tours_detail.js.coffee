$(".contact_looking_for_all").empty()
  .append("<%= escape_javascript(render 'contacts/tours_details', tours: @tours) %>")
#seperatly
$("#<%= "loading_p_#{@tour.en_name}" %>").remove()
$("#<%= "departures_of_#{@tour.en_name}" %>").append("<%= escape_javascript(render 'contacts/tours_details', tour: @tour) %>")

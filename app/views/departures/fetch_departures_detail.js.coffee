$("#departure_preview").empty()
  .append("<%= escape_javascript(render 'departures/departure_detail', en_name: @en_name, limit: @limit) %>")
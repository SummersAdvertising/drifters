$ ->
  #fetch departures
  $(document).on 'ready', (evt) ->
    if $("#looking_for") && $("#looking_for").text() != ""
      $.ajax '/departures/fetch_departures_detail',
        type: 'GET'
        dataType: 'script'
        data: {
          looking_for: $("#looking_for").text()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          # console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          # console.log("Ajax  select OK!")
$ ->
  #fetch departures
  $(document).on 'ready', (evt) ->
    if $("#contact_looking_for_all") && $("#contact_looking_for_all").text() == "ALL"
      $.ajax '/contacts/fetch_tours_detail',
        type: 'GET'
        dataType: 'script'
        data: {
        }
        error: (jqXHR, textStatus, errorThrown) ->
          # console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          $("#accordion").accordion(heightStyle: "content")
          # console.log("Ajax  select OK!")
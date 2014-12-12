$ ->
  #fetch departures
  $(document).on 'ready', (evt) ->
    if $("#contact_looking_for_all") && $("#contact_looking_for_all").text() == "ALL"
      #all_tours = ['Kruger_Park_5_day', 'South_Africa_18_day']
      all_tours = ['Kruger_Park_5_day', 'South_Africa_18_day', 'Namibia_12_day', 'Southern_Circle_24_day', 'Uganda_12_day', 'Southern_Cruise_24_day', 'Botswana_16_day', 'Namibia_12_day', 'Mozambique_14_day', 'Zimbabwe_16_day']
      $(all_tours).each (index, element) ->
        $.ajax '/contacts/fetch_tours_detail',
          type: 'GET'
          dataType: 'script'
          data: {
            looking_for: element
          }
          error: (jqXHR, textStatus, errorThrown) ->
            console.log("AJAX Error: #{textStatus}")
          success: (data, textStatus, jqXHR) ->
            console.log("Ajax  select OK! #{element}")
      # fetch all at once
      # $.ajax '/contacts/fetch_tours_detail',
      #   type: 'GET'
      #   dataType: 'script'
      #   data: {
      #   }
      #   error: (jqXHR, textStatus, errorThrown) ->
      #     # console.log("AJAX Error: #{textStatus}")
      #   success: (data, textStatus, jqXHR) ->
      #     $("#accordion").accordion(heightStyle: "content")
      #     # console.log("Ajax  select OK!")
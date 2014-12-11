#encoding: utf-8
module StaticsHelper
  
  def fetch_departures(looking_for, limit)
    departures = Departure.where(tour_id: Tour.where(en_name: looking_for) ).order(:ranking)
    items_count = 0
    items = ""
    departures.each do | schedule |
      data = JSON.parse_if_json(open(schedule.url).read) rescue break;
    
      if data && data.length >= 1 
         data.each do |event| 
          items << "<div class='col-md-3 col-sm-6'><div class='tag'>
            #{event['date']}<span> #{event['pax']}</span>
          </div></div>"
          items_count += 1
          break if items_count == limit
         end 
      end 

      break if items_count == limit
    end 

    return items
  end

end

#encoding: utf-8
module ContactsHelper

  def get_contact_status(contact)
    if contact.status == "new"
      link_to( "已處理", admin_contact_path(contact), :method => "put" , class: "uvs")
    else 
      "已處理"
    end
  end

  def fetch_all_tour_details(tours)
    items = ""
    tours.each do | tour |
      items << "<h3>#{tour.name}</h3><div><p>所有日期都是根據當地出發地，並非從台灣出發<br>白色欄位內則為當次剩餘座位數量</p><div class='row'>"
      tour.departures.each do | departure |
        data = JSON.parse_if_json(open(departure.url).read) rescue break;  

        if data && data.length >= 1 
          data.each do |event| 
           items << "<div class='col-md-3 col-sm-6'><div class='tag'>
             #{event['date']}<span> #{event['pax']}</span>
           </div></div>"
          end # end date
        end 
      end # end departure
       items << "</div></div>"
    end #end tour

    return items

  end

end
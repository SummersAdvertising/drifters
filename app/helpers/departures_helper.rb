#encoding: utf-8
module DeparturesHelper

  def get_departure_type(departure)
    
    case departure.filter_type
      when "1"
        type = "所有(不分類)"
      when "2"
        type = "到年底"
      when "3"
        type = "明年出發"
      else
        type = "ERR"
    end
    
  end

end
class Departure < ActiveRecord::Base

  validates_presence_of :name, :url, :filter_type
  
  paginates_per 10

end

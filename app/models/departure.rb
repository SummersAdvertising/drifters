class Departure < ActiveRecord::Base

  belongs_to :tour

  before_validation :check_attrs

  validates_presence_of :name, :url, :filter_type
  
  paginates_per 10

  private

  def check_attrs
    self.url = URI.encode(self.url) unless json_url_valid?(self.url)
  end

  def json_url_valid?(uri)
    
    return !!URI.parse(uri)

    rescue URI::InvalidURIError
      return false
  end

end

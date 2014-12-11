class Departure < ActiveRecord::Base

  belongs_to :tour

  before_validation :check_attrs

  validates_presence_of :name, :url, :filter_type
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validate :url_has_drifters_domain

  paginates_per 10

  private

  def check_attrs
    self.url = URI.encode(self.url) unless json_url_valid?(self.url)
  end
  
  def url_has_drifters_domain
    uri = URI.parse(url)
    if uri
      if uri.host != 'drifters.acitravel.co.za'
        errors[:url] << "host is not permitted."
        return false
      end
    end
  end

  def json_url_valid?(url)
    
    return !!URI.parse(url)

    rescue URI::InvalidURIError
      return false
  end

end

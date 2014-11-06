class Contact < ActiveRecord::Base

  serialize :subject, Array
  
  validates_presence_of :name, :subject, :email, :phone, :content
  
  paginates_per 10
  
end

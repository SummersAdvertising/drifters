#encoding: utf-8
class DriftersMailer < ActionMailer::Base
  #require this lib when sending email by MailGun API
  require 'multimap'
  
  before_action :set_basic_data
  
  # send to user
  def contact_notice(contact)
    # attachments.inline['emaillogo.jpg'] = with_logo_image
    ActiveRecord::Base.connection_pool.with_connection do

      @contact = contact
      # through api: set params
      # @data[:to] = [ 'adam@summers.com.tw', 'chris@summers.com.tw' ]
      @data[:to] = [ 'info@crown-yourafrica.com', 'baowei@bwtravel.com.tw' ]
      @data[:subject] = "報名通知" # 主旨
      @data[:html] = render_to_string('contact_notice').to_str # 內容
      # through api: set params end
      deliver_by_api(@data)

    end
  end

  private

  # MAILGUN
  def set_basic_data
    @data = Multimap.new
    @data[:from] = "大旅行家│Drifters <postmaster@mg.drifters.com.tw>"
    #@data[:inline] = File.new(File.join("public","images","email", "maillogo.jpg")) # inline img
  end

  def deliver_by_api(data)
    RestClient.post "https://api:#{ Rails.application.config.action_mailer.mailgun_settings[:api_key]}@api.mailgun.net/v2/#{ Rails.application.config.action_mailer.mailgun_settings[:domain]}/messages", data.to_hash
  end

  # def with_logo_image
  #   File.read(File.join("public","images","email", "maillogo.jpg")) # inline img
  # end

end

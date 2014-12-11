#encoding: utf-8
class ContactsController < ApplicationController
  #new business contact
  def index
    @contact = Contact.new()
    @tours = Tour.order(:ranking)
    @genders = [['男','男'],['女','女']]
  end

  def create
    
    if verify_recaptcha

      @contact = Contact.create(contact_params)

      respond_to do |format|
        if @contact.save
          
          DriftersmailerJob.new.async.perform(DriftersMailer, :contact_notice, @contact)
          
          flash[:notice] = "留言已送出"
          format.html { redirect_to contacts_path() }
        else
          
          @tours = Tour.order(created_at: :desc)
          @genders = [['男','男'],['女','女']]
          flash.now[:notice] = @contact.errors.messages.values.flatten.join('<br />')
          format.html { render :index }
        end
      end
    
    else
      @contact = Contact.new
      @tours = Tour.order(created_at: :desc)
      @genders = [['男','男'],['女','女']]

      flash.now[:alert] = "驗證碼錯誤"
      flash.delete :recaptcha_error
      render :index
    end

  end
  
  def fetch_tours_detail
    begin
      
      @tours = Tour.order(:ranking).limit(2) #第一階段適用
          
      respond_to do |format|
        format.js
      end

    rescue
      redirect_to root_path
    end

  end
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params  
    params.require(:contact).permit({:subject =>[]}, :name, :email, :phone, :address, :gender, :departure_date, :content)
  end
end
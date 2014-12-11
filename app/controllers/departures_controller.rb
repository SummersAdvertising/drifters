#encoding: utf-8
class DeparturesController < ApplicationController
  
  def fetch_departures_detail
    begin
      if params[:looking_for].in? Tour.order(:ranking).pluck(:en_name)
        @en_name = params[:looking_for].to_s
        @limit = 12
      end

      respond_to do |format|
        format.js
      end

    rescue
      redirect_to root_path
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  # def departure_params  
  #   params.require(:departure).permit({:subject =>[]}, :name, :email, :phone, :address, :gender, :departure_date, :content)
  # end
end
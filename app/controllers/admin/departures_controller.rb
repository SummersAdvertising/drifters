#encoding: utf-8
class Admin::DeparturesController < AdminController
  
  before_action :set_tour
  before_action :set_departure, only: [:edit, :update, :destroy]

  def index
    @departures = Departure.where(tour_id: params[:tour_id]).order(:ranking) if Tour.where(id: params[:tour_id])
  end

  def new
    @departure = Departure.new
    @tours = Tour.order(:ranking)
  end

  def create
    @departure = Departure.new(departure_params)

    respond_to do |format|
      if @departure.save
        format.html { redirect_to admin_tour_departures_path(@tour), notice: 'successfully created.' }
      else
        @tours = Tour.order(:ranking)
        flash.now[:notice] = @departure.errors.full_messages 
        format.html { render :new }
      end
    end

  end
  
  def edit 
    @tours = Tour.order(created_at: :desc)
  end

  def update

    @departure.update(departure_params) 
    
    respond_to do |format|
      if @departure.save
        format.html { redirect_to edit_admin_tour_departure_path(@tour,@departure), notice: '更新成功' }
      else
        @tours = Tour.order(created_at: :desc)
        flash.now[:notice] = @departure.errors.full_messages
        format.html { render :edit }
      end      
    end
  end

  def destroy

    @departure.destroy
    
    redirect_to :back
  end

  def reorder
    errorFlag = false
    params[:departures][:reorderset].each_with_index do | departureid , index |
      the_departure = Departure.find(departureid)
      if !the_departure.nil?
        the_departure.update_attribute(:ranking , index+1 )
      else
        errorFlag = true
      end
    end

    respond_to do |format|
      if errorFlag
        format.json { head :no_content }
      else
        flash[:notice] = "重新排序成功"
        format.json do render json: flash end
      end
    end

  end  

  private
  def set_tour
    @tour = Tour.find_by_id(params[:tour_id])
  end

  def set_departure
    @departure = Departure.find_by_id(params[:id])
  end

  def departure_params
    params.require(:departure).permit(:name, :filter_type, :url, :tour_id)
  end

end
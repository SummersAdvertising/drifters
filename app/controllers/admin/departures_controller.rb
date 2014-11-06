#encoding: utf-8
class Admin::DeparturesController < AdminController
  
  before_action :set_departure, only: [:edit, :update]

  def index
    @departures = Departure.all.page(params[:page])
  end

  def new
    @departure = Departure.new
    @tours = Tour.order(created_at: :desc)
  end

  def create
    @departure = Departure.new(departure_params)

    respond_to do |format|
    if @departure.save
        format.html { redirect_to admin_departures_path(), notice: 'successfully created.' }
      else
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
        format.html { redirect_to :back, notice: '更新成功' }
        #format.html { redirect_to admin_product_cate_product_path(Departure.product_cate_id, Departure) }
      else
        format.html { render :back, notice: @departure.errors.full_messages }
      end      
    end
  end

  private

  def set_departure
    @departure = Departure.find_by_id(params[:id])
  end

  def departure_params
    params.require(:departure).permit(:name, :filter_type, :url, :tour_id)
  end

end
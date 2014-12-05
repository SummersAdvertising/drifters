#encoding: utf-8
class Admin::ToursController < AdminController
  
  before_action :set_tour, only: [:edit, :update, :destroy]

  def index
    @tours = Tour.order(:ranking)
  end

  def new
    @tour = Tour.new
    @tours = Tour.order(:ranking)
  end

  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to admin_tours_path(), notice: 'successfully created.' }
      else
        @tours = Tour.order(:ranking)
        flash.now[:notice] = @tour.errors.full_messages 
        format.html { render :new }
      end
    end

  end
  
  def edit 
    @tours = Tour.order(created_at: :desc)
  end

  def update

    @tour.update(tour_params) 
    
    respond_to do |format|
      if @tour.save
        format.html { redirect_to edit_admin_tour_path(@tour), notice: '更新成功' }
      else
        @tours = Tour.order(created_at: :desc)
        flash.now[:notice] = @tour.errors.full_messages
        format.html { render :edit }
      end      
    end
  end

  def destroy

    @tour.destroy
    
    redirect_to :back
  end

  private

  def set_tour
    @tour = Tour.find_by_id(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :filter_type, :url, :tour_id)
  end

end
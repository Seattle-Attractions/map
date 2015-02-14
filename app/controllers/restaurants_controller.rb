class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    respond_to { |format| format.js }
  end

  def show
    @fields = [:name, :address, :latitude, :longitude, :price, :phone, :website]
    @restaurant = Restaurant.find(params[:id])
    respond_to { |format| format.js }
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    respond_to { |format| format.js }
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash.now[:notice] = 'Parking lot saved'
    end
    respond_to { |format| format.js }
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to { |format| format.js }
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      flash.now[:notice] = 'Parking lot saved'
    end
    respond_to { |format| format.js }
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :address,
      :latitude,
      :longitude,
      :website,
      :phone,
      :price
      )
  end
end

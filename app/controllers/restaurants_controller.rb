class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurants_hash = build_json_hash(@restaurants)
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'restaurant saved'
    else
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, notice: 'restaurant destroyed'
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Article updated'
    else
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :address,
      :latitude,
      :longitude,
      :website,
      :price
      )
  end
end

class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
    @locations = Location.all
  end

  def show
    @fields = [
      :name,
      :address,
      :location_id,
      :description,
      :latitude,
      :longitude,
      :website,
      :coupon_url
    ]
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
    @locations = Location.all
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction, notice: 'Attraction saved'
    else
      render :new
    end
  end

  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    redirect_to attractions_path, notice: 'Attraction destroyed'
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: 'Article updated'
    else
      render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :description,
      :latitude,
      :longitude,
      :website,
      :location_id,
      :address,
      :icon,
      :coupon_url)
  end
end

class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
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
      :icon_url,
      :coupon_url
    ]
    @attraction = Attraction.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @attraction = Attraction.new
    @locations = Location.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction saved' }
        format.js { flash.now[:notice] = 'Attraction saved' }
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
    @locations = Location.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @attraction = Attraction.find(params[:id])
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Article updated' }
        format.js { flash.now[:notice] = 'Article updated'}
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    respond_to do |format|
      format.html do
        redirect_to attractions_path, notice: 'Attraction destroyed'
      end
      format.js { flash.now[:notice] = 'Attraction destroyed' }
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
      :icon_url,
      :coupon_url)
  end
end

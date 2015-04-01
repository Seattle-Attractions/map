class AttractionsController < ApplicationController
  before_action :detect_device
  before_action :authenticate_admin!
  skip_before_action :authenticate_admin!, only: [:show, :index]

  def index
    respond_to do |format|
      format.html.phone do
        @attractions = Attraction.order(name: :desc).all
      end
      format.html.desktop do
        authenticate_admin!
        @attractions = Attraction.order(name: :desc).all
      end
    end
  end

  def show
    @device = 'others'
    respond_to do |format|
      format.html.phone do
        @attraction = Attraction.find(params[:id])
      end

      format.html.desktop do
        authenticate_admin!
        @fields = [
          :name,
          :address,
          :phone,
          :location_id,
          :description,
          :latitude,
          :longitude,
          :website,
          :icon,
          :coupon_url
        ]
        @attraction = Attraction.find(params[:id])
      end

      format.js.desktop do
        authenticate_admin!
        @fields = [
          :name,
          :address,
          :phone,
          :description,
          :latitude,
          :longitude,
          :website,
          :icon,
          :coupon_url
        ]
        @attraction = Attraction.find(params[:id])
      end
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
        format.html { redirect_to attractions_path, notice: 'Attraction saved' }
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
        format.html { redirect_to attractions_path, notice: 'Article updated' }
        format.js { flash.now[:notice] = 'Article updated' }
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
      :icon,
      :phone,
      :coupon_url)
  end

  def detect_device
    case request.user_agent
    when /iPhone/i
      request.variant = :phone
    when /Android/i && /mobile/i
      request.variant = :phone
    when /Windows Phone/i
      request.variant = :phone
    else
      request.variant = :desktop
    end
  end

end

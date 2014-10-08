class AttractionsController < ApplicationController
  skip_before_action :authenticate_admin!, only: [:index, :show]

  def index
    params[:location] ||= ''
    if params[:location] == ''
      @attractions = Attraction.all
    else
      @attractions = Location.find(params[:location]).attractions
    end
    @markers_hash = build_json_hash(@attractions + ParkingLot.all + Restaurant.all)
    @locations = Location.all
  end

  def new
    @attraction = Attraction.new
    @locations = Location.all
  end

  def show
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

  def build_json_hash(locations)
    Gmaps4rails.build_markers(locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.json(id: location.id)
      marker.picture('url' => ActionController::Base.helpers.asset_path(find_marker(location), type: :image),
                     'width' =>  30,
                     'height' => 30)
      marker.infowindow render_to_string(partial: find_partial(location), locals: { location: location })
    end
  end

  def find_partial(location)
    case location.class.to_s
    when 'Attraction' then 'attractions/info_window'
    when 'ParkingLot' then 'parking_lots/info_window'
    when 'Restaurant' then 'restaurants/info_window'
    end
  end

  def find_marker(location)
    case location.class.to_s
    when 'Attraction' then 'attractions.svg'
    when 'ParkingLot' then 'parking_lots.jpeg'
    when 'Restaurant' then 'restaurants.png'
    end
  end

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :description,
      :latitude,
      :longitude,
      :website,
      :location_id,
      :address
      )
  end
end

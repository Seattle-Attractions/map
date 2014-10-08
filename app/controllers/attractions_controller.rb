class AttractionsController < ApplicationController
  skip_before_action :authenticate_admin!, only: [:index, :show]
  def index
    @attractions = Attraction.all
    @attractions_hash = build_json_hash(@attractions)
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
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
      marker.picture('url' => 'http://dl.dropbox.com/s/mumk8tzf3fze87h/map-marker-14.svg?dl=0',
                     'width' =>  60,
                     'height' => 60)
      marker.infowindow render_to_string(partial: '/attractions/info_window', locals: { location: location })
    end
  end

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :description,
      :latitude,
      :longitude,
      :website,
      :location,
      :address
      )
  end
end

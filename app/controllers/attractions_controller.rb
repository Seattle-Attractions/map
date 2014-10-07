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

  def build_json_hash(stuff)
  Gmaps4rails.build_markers(stuff) do |stuff, marker|
    marker.lat stuff.latitude
    marker.lng stuff.longitude
    marker.json({:id => stuff.id })
    marker.picture({
     "url" => "http://dl.dropbox.com/s/hyc9o4m5mrx0iok/map%20marker.jpg?dl=0",
     "width" =>  32,
     "height" => 27})
    marker.infowindow "Hi, I'm the #{stuff.name}. You can find me at
    #{stuff.address}. Description: #{stuff.description}"
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

class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end
end

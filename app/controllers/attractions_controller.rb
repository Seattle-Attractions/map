class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @attractions = Attraction.all
  end
end

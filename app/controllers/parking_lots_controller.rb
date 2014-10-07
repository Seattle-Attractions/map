class ParkingLotsController < ApplicationController
  def index
    @parking_lots = ParkingLot.all
  end

  def new
    @parking_lot = ParkingLot.new
  end

  def show
    @parking_lot = ParkingLot.find(params[:id])
  end

  def edit
    @parking_lot = ParkingLot.find(params[:id])
  end

  def create
    @parking_lot = ParkingLot.new(parking_lot_params)
    if @parking_lot.save
      redirect_to @parking_lot, notice: 'Parking location saved'
    else
      render :new
    end
  end

  def destroy
    @parking_lot = ParkingLot.find(params[:id])
    @parking_lot.destroy
    redirect_to parking_lots_path, notice: 'Parking location destroyed'
  end

  def update
    @parking_lot = ParkingLot.find(params[:id])
    if @parking_lot.update(parking_lot_params)
      redirect_to @parking_lot, notice: 'Article updated'
    else
      render :edit
    end
  end

  private

  def parking_lot_params
    params.require(:parking_lot).permit(
      :name,
      :address,
      :latitude,
      :longitude,
      :hours,
      :rates
      )
  end
end

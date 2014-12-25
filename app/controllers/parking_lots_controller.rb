class ParkingLotsController < ApplicationController
  def index
    @parking_lots = ParkingLot.all
  end

  def new
    @parking_lot = ParkingLot.new
    respond_to { |format| format.js }
  end

  def show
    @fields = [
      :name,
      :address,
      :latitude,
      :longitude,
      :hours,
      :rates
    ]
    @parking_lot = ParkingLot.find(params[:id])
    respond_to { |format| format.js }
  end

  def edit
    @parking_lot = ParkingLot.find(params[:id])
  end

  def create
    @parking_lot = ParkingLot.new(parking_lot_params)
    if @parking_lot.save
      flash.now[:notice] = 'Parking lot saved'
    end
    respond_to { |format| format.js }
  end

  def destroy
    @parking_lot = ParkingLot.find(params[:id])
    @parking_lot.destroy
    respond_to { |format| format.js }
  end

  def update
    @parking_lot = ParkingLot.find(params[:id])
    if @parking_lot.update(parking_lot_params)
      flash.now[:notice] = 'Parking lot saved'
    end
    respond_to { |format| format.js }
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

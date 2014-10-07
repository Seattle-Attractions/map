require "test_helper"

class ParkingLotTest < ActiveSupport::TestCase

  def parking_lot
    @parking_lot ||= ParkingLot.new
  end

  def test_valid
    assert parking_lot.valid?
  end

end

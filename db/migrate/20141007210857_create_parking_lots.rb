class CreateParkingLots < ActiveRecord::Migration
  def change
    create_table :parking_lots do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :hours
      t.string :rates

      t.timestamps
    end
  end
end

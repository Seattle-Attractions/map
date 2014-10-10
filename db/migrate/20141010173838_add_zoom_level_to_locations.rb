class AddZoomLevelToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :zoom_level, :integer
  end
end

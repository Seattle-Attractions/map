class AddIndexToLocations < ActiveRecord::Migration
  def change
    add_index :locations, :name
  end
end

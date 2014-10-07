class ChangeAttractionsLocationToLocationId < ActiveRecord::Migration
  def up
    remove_column :attractions, :location
    add_column :attractions, :location_id, :integer
  end

  def down
    remove_column :attractions, :location_id
    add_column :attractions, :location, :string
  end
end

class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :website
      t.string :location

      t.timestamps
    end
  end
end

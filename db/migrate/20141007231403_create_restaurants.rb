class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :Name
      t.string :Address
      t.string :Phone
      t.string :Website
      t.string :Price

      t.timestamps
    end
  end
end

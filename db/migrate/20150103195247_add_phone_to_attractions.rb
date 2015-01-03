class AddPhoneToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :phone, :string
  end
end

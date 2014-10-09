class AddImagesToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :icon_url, :string
  end
end

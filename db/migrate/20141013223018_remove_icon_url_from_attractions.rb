class RemoveIconUrlFromAttractions < ActiveRecord::Migration
  def up
    remove_column :attractions, :icon_url
  end

  def down
    add_column :attractions, :icon_url, :string
  end
end

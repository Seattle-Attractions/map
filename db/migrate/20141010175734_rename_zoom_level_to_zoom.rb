class RenameZoomLevelToZoom < ActiveRecord::Migration
  def change
    rename_column :locations, :zoom_level, :zoom
  end
end

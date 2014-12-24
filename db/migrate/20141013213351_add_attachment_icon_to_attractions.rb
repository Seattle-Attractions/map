class AddAttachmentIconToAttractions < ActiveRecord::Migration
  def self.up
    change_table :attractions do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :attractions, :icon
  end
end

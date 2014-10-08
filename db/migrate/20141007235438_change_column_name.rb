class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :restaurants, :Name, :name
    rename_column :restaurants, :Address, :address
    rename_column :restaurants, :Phone, :phone
    rename_column :restaurants, :Website, :website
    rename_column :restaurants, :Price, :price
  end
end

class AddCouponsToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :coupon_url, :string
  end
end

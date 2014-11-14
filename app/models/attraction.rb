class Attraction < ActiveRecord::Base
  belongs_to :location
  geocoded_by :address
  # auto-fetch coordinates and the condition is for preventing fetching the same address more than once
  after_validation :geocode, if: :address_changed?

  has_attached_file :icon, styles: { map_icon: "200x100>" }
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

  def self.alphabetize
    order(name: :asc)
  end
end

class Attraction < ActiveRecord::Base
  belongs_to :location
  geocoded_by :address
  # auto-fetch coordinates and the condition is for preventing fetching the same address more than once
  after_validation :geocode, if: :address_changed?

  def self.alphabetize
    order(name: :asc)
  end
end

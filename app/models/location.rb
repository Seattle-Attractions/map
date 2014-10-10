class Location < ActiveRecord::Base
  has_many :attractions

  validates :name, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end

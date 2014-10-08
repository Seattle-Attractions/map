class Location < ActiveRecord::Base
  has_many :attractions

  validates :name, presence: true
end

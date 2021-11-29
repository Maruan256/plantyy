class GardenKit < ApplicationRecord
  has_many :kit_plants, dependent: :destroy
  has_many :plants, through: :kit_plants
  belongs_to :my_garden
end

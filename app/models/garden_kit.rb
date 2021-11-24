class GardenKit < ApplicationRecord
  has_many :kit_plants
  has_many :garden_kit_in_gardens
end

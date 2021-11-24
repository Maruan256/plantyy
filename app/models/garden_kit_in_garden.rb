class GardenKitInGarden < ApplicationRecord
  belongs_to :user
  belongs_to :garden_kit
  has_many :my_plants
end

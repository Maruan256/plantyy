class KitPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :garden_kit
end

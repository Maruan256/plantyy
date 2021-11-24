class MyGarden < ApplicationRecord
  belongs_to :user
  has_many :my_plants
  has_many :garden_kits
end

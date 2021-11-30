class MyGarden < ApplicationRecord
  belongs_to :user
  has_many :my_plants, dependent: :destroy
  has_many :garden_kits
end

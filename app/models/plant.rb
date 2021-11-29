class Plant < ApplicationRecord
  validates :name, presence: true
  has_many :my_plants, dependent: :destroy
  has_many :kit_plants
end

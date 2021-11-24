class Plant < ApplicationRecord
  validates :name, presence: true
  has_many :conditions, through: :plants_condition
  has_many :my_plants
  has_many :kit_plants
end

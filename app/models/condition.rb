class Condition < ApplicationRecord
  has_many :plants, through: :plants_condition
end

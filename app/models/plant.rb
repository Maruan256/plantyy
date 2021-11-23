class Plant < ApplicationRecord
  validates :name, presence: true
  has_many :conditions, through: :plants_condition
end

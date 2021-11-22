class PlantsCondition < ApplicationRecord
  belongs_to :plant
  belongs_to :condition
end

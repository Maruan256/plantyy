class DropPlantsConditionsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :plants_conditions
  end
end

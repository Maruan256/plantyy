class CreatePlantsConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :plants_conditions do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMyPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :my_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.integer :water_level
      t.integer :fertilizer_level
      t.integer :harvest_level
      t.boolean :bring_in
      t.timestamps
    end
  end
end

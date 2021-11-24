class CreateKitPlant < ActiveRecord::Migration[6.0]
  def change
    create_table :kit_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :garden_kit, null: false, foreign_key: true
    end
  end
end

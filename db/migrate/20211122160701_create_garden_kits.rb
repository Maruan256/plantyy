class CreateGardenKits < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_kits do |t|
      t.string :kit_name
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end

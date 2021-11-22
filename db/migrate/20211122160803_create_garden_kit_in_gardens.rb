class CreateGardenKitInGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :garden_kit_in_gardens do |t|
      t.references :user, null: false, foreign_key: true
      t.references :garden_kit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

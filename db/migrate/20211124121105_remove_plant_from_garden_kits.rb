class RemovePlantFromGardenKits < ActiveRecord::Migration[6.0]
  def change
    remove_column :garden_kits, :plant_id
  end
end

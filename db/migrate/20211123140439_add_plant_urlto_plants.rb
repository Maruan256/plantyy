class AddPlantUrltoPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :plant_url, :string
  end
end

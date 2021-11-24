class AddActiveToMyPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :my_plants, :active, :boolean
  end
end

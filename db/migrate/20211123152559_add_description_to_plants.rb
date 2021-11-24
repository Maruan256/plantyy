class AddDescriptionToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :description, :text
  end
end

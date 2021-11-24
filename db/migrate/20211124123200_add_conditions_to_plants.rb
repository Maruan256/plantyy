class AddConditionsToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :sunlight, :string
    add_column :plants, :water, :string
    add_column :plants, :cat, :string
  end
end

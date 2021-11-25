class AddNameToMyGarden < ActiveRecord::Migration[6.0]
  def change
    add_column :my_gardens, :my_garden_name, :string
  end
end

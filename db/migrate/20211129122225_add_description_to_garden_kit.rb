class AddDescriptionToGardenKit < ActiveRecord::Migration[6.0]
  def change
    add_column :garden_kits, :description, :string
  end
end

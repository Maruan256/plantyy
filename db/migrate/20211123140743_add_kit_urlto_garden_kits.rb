class AddKitUrltoGardenKits < ActiveRecord::Migration[6.0]
  def change
    add_column :garden_kits, :kit_url, :string
  end
end

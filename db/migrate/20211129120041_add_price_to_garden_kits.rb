class AddPriceToGardenKits < ActiveRecord::Migration[6.0]
  def change
    add_column :garden_kits, :price, :string
  end
end

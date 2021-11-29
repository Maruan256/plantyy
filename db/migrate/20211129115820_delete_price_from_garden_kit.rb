class DeletePriceFromGardenKit < ActiveRecord::Migration[6.0]
  def change
    remove_column :garden_kits, :price
  end
end

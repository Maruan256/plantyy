class CreateKitPlants < ActiveRecord::Migration[6.0]
  def change
    create_table :kit_plants do |t|

      t.timestamps
    end
  end
end

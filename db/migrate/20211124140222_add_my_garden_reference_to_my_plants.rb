class AddMyGardenReferenceToMyPlants < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_plants, :my_garden, foreign_key: true
  end
end

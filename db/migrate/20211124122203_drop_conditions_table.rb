class DropConditionsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :conditions
  end
end

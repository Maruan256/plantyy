class CreateMyGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :my_gardens do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

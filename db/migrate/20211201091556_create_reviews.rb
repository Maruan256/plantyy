class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :garden_kit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

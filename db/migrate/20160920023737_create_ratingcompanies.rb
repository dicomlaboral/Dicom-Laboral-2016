class CreateRatingcompanies < ActiveRecord::Migration
  def change
    create_table :ratingcompanies do |t|
      t.integer :value
      t.references :work, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.date :start_date
      t.date :end_date
      t.text :comment_user
      t.text :comment_company
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

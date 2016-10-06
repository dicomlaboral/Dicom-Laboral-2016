class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :rut
      t.string :phone
      t.string :address
      t.string :activity

      t.timestamps null: false
    end
  end
end

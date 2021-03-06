class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :description
      t.boolean :active
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

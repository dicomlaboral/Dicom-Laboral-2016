class AddFromToWork < ActiveRecord::Migration
  def change
    add_column :works, :from, :varchar
  end
end

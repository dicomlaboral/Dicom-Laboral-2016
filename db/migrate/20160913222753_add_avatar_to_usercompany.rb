class AddAvatarToUsercompany < ActiveRecord::Migration
  def change
    add_column :usercompanies, :photo, :string
  end
end

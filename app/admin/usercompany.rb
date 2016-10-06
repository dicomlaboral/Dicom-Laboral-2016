ActiveAdmin.register Usercompany do

	menu parent: "Companies", label: "Users Company"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :firstname, :lastname, :created_at, :company, :phone, :dni, :birthday, :confirmed_at, :photo, :email
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do
		selectable_column
	    id_column
	    column :firstname
	    column :email
	    column :company
	    column :created_at
	    actions
	end


end

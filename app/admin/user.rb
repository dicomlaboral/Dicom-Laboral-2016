ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

	permit_params :firstname, :lastname, :rut, :phone, :dni, :birthday, :confirmed_at

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
	    columns :rut
	    column :created_at
	    actions
	end

end

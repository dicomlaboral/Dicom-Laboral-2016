module CompaniesHelper

	def resource_name_company
		:usercompany
	end

	def resource_company
		@resource_company ||= Usercompany.new
	end

	def devise_mapping_company
		@devise_mapping_company ||= Devise.mappings[:usercompany]
	end
end

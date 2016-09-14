module CompaniesHelper

	def resource_name
		:usercompany
	end

	def resource
		@resource ||= Usercompany.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:usercompany]
	end
end

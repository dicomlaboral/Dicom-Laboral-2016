class Company < ActiveRecord::Base
	has_many :usercompanies, dependent: :destroy

end

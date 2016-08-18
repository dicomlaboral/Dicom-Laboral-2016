class Company < ActiveRecord::Base
	has_many :usercompanies, dependent: :destroy
	has_many :works
	has_many :users, through: :works
end

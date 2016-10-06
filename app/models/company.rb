class Company < ActiveRecord::Base
	has_many :usercompanies, dependent: :destroy
	has_many :works
	has_many :users, through: :works

	mount_uploader :logo, PhotoUploader
end

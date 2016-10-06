class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
   	has_many :works
   	has_many :companies, through: :works
   	mount_uploader :photo, PhotoUploader
end

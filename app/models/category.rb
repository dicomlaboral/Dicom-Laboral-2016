class Category < ActiveRecord::Base
  belongs_to :template
  has_many :ratingusers
  has_many :ratingcompanies
  has_many :works, through: :ratingusers
  has_many :works, through: :ratingcompanies
end

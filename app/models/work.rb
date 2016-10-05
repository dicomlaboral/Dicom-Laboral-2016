class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :ratingusers
  has_many :ratingcompanies
  has_many :categories, through: :ratingusers
  has_many :categories, through: :ratingcompanies
end

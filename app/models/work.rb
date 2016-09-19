class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :ratingusers
  has_many :ratingcompanies
end

class Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :ratingusers
end

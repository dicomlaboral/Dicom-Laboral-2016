# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

require 'carrierwave/orm/activerecord'

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['sendgrid_username'],
  :password => ENV['sendgrid_password'],
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
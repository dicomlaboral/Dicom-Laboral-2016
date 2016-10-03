ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '25',
  :domain => 'localhost:3000',
  #:domain => 'example.com',
  :authentication => :plain,
  :user_name => ENV['sendgrid_username'],
  :password => ENV['sendgrid_password']
}

SendGrid.configure do |config|
  config.dummy_recipient = 'ocmchile@gmail.com'
end
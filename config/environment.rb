# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application

Pms::Application.initialize!
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "mail.gmail.com",
  :user_name            => "vinaycs01@gmail.com",
  :password             => "iamvinay9015578056",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options = {:host => "localhost:3000"}



# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
WarmGreet::Application.initialize!

if Rails.env.production?
  # only send real emails in production; use Sengrid
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => 'fadils',
    :password       => 'sendgrid@021103F',
    :domain         => 'sendgrid.com'
  }
  ActionMailer::Base.delivery_method ||= :smtp
elsif Rails.env.development?
  # Remember the letter_opener gem? It won't send real emails; it
  # just opens them in another tab.
  #ActionMailer::Base.delivery_method = :letter_opener
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => 'fadils',
    :password       => 'sendgrid@021103F',
    :domain         => 'sendgrid.com'
  }
  ActionMailer::Base.delivery_method ||= :smtp

end

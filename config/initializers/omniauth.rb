Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']

  provider :twitter, ENV['caB1N6FvkE0nhaemotOVYg'], ENV['HhDaZpjB5SuXW4CeJPMD72zAh6bDDnRzF4hEC0QvBcY']
end
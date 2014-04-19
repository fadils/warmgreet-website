Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '514346035345041', '774b6afa5b332fb071c409a4ffdb5f7c'

  provider :twitter, 'caB1N6FvkE0nhaemotOVYg', 'HhDaZpjB5SuXW4CeJPMD72zAh6bDDnRzF4hEC0QvBcY'
end
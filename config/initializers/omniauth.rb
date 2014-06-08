Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env.production?
  		provider :facebook, '514346035345041', '774b6afa5b332fb071c409a4ffdb5f7c'
  		provider :twitter, 'caB1N6FvkE0nhaemotOVYg', 'HhDaZpjB5SuXW4CeJPMD72zAh6bDDnRzF4hEC0QvBcY'
  	else
  		provider :facebook, '1439925826226688', '0e9119fd480f7ced8e7a60f4166ea5e2'
  	end
end
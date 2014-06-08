WarmGreet::Application.routes.draw do

  get "about/index"

  get "electronics/index"

  get "writestory/write"

  get "profile/index"

  get "thankyou/index"

  get "sessions/new"

  get "merchants/index"

  get "reviews/story"

  get "favorites/show"

  get "follows/following"


  get "follows/followers"

  resources :users, :only => [:create, :new, :show, :edit, :update, :index, :profile] do
    resources :follows, :only => [:create, :destroy]
    get 'activate'
  end

  resources :categories, :only => [:create, :new, :show, :edit, :update, :index, :profile] do
    resources :follows, :only => [:create, :destroy]
    get 'activate'
  end




  resources :customers, :only => [:create, :new, :show, :edit, :update, :index] do
    #resources :follows, :only => [:create, :destroy]
    get 'activate'
  end

  resource :session, :only => [:create, :destroy, :new]

  resource :customersession, :only => [:create, :destroy, :new]

  resources :restaurants, :except => [:index, :new, :create] do
    resources :reviews, :only => [:create, :new, :index]
    resources :favorites, :only => [:create, :destroy]
  end

  resources :merchants, :except => [:index, :new, :create] do
    resources :reviews, :only => [:create, :new, :index]
    resources :favorites, :only => [:create, :destroy]
  end

  get 'search' => "merchants#search"

  #resources :cities, :only => [:show, :index] do
   # resources :restaurants, :only => [:index, :new, :create]
  #end

  resources :countries, :only => [:show, :index] do
    resources :merchants, :only => [:index, :new, :create]
  end

  resources :reviews, :only => [:show, :edit, :update, :destroy] do
    resources :vote_tags, :only => [:create, :destroy]
  end

  get '/auth/:provider/callback', to: 'sessions#create'

  root :to => "merchants#index"
  #root :to => "restaurants#index"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

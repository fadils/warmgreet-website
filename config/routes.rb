WarmGreet::Application.routes.draw do

  get "guideline/index"

  get "about/index"

  get "electronics/index"

  get "writestory/write"

  get "profile/show"

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
  end

Rails.application.routes.draw do

  get '/about', to: 'about#show'
  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    
    # adding :categories resoueces in admin block
    # only new, index and create
    resources :categories, only: [:new, :index, :create]
  end

  # sign up page with form:
  get 'users/new' => 'users#new', as: :new_user

  # create (post) action for when sign up form is submitted:
  post 'users' => 'users#create'

  # log in page with form:
	get '/login'     => 'sessions#new'
	
	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'
	
	# delete action to log out:
	delete '/logout' => 'sessions#destroy'  

end

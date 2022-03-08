Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # API Routes 
  # a way to link up to the controller 
  # react side to use

  # back end as an api and also the controllers will
  # http request
  # communicate in the browser
  # have react communicate to the rails side using these routes

  namespace :api do
    # where all our routes will be in
    # http verb 'url path', to: 'controller#action'
    # get '/people', to: 'people#index'
    
    # this will create all of the routes for all base crud actions
    resources :subs do
      resources :topics
    end

    resources :topics, except: [:index, :show, :update, :create, :destroy] do
      resources :likes
    end

    resources :topics, except: [:index, :show, :update, :create, :destroy] do
      resources :comments
    end

  end




end

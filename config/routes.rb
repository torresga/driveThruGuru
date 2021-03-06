Rails.application.routes.draw do
  root 'pages#index'

  get '/search', to: 'pages#search'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'

  resources :restaurants, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :reviews, only: [:create, :destroy, :new]
end

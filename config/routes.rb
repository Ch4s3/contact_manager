ContactManager::Application.routes.draw do

  resources :companies, :people

  resources :phone_numbers, :except => [:index, :show]
  resources :email_addresses, :except => [:index, :show]

  get '/auth/:provider/callback' => 'sessions#create'

  resource :sessions, :only => [:create, :destroy]
  root :to => 'site#index'
  get "/login" => redirect("/auth/twitter"), as: :login
  delete "/logout" => "sessions#destroy", as: :logout
end

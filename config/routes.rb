ContactManager::Application.routes.draw do
  resources :companies, :people

  resources :phone_numbers, :except => [:index, :show]
  resources :email_addresses, :except => [:index, :show]


end

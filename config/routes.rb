ContactManager::Application.routes.draw do
  resources :companies, :people, :email_addresses

  resources :phone_numbers, :except => [:index, :show]


end

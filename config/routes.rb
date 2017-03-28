Rails.application.routes.draw do

  root 'home#welcome'
  devise_for :users
  resources :users
  resources :stations
  resources :chains
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

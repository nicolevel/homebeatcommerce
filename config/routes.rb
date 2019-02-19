Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'pages/home'
  get 'pages/garantia', as: 'garantia'
  devise_for :users
  root to: 'pages#home'

  resources :searches
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

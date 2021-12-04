Rails.application.routes.draw do
  resources :products
  resources :orders
  resources :contacts
  resources :clients
  resources :dashboard
  get 'home/index'
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
end

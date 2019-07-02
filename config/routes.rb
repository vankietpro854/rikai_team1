Rails.application.routes.draw do
  resources :chapters
  resources :cours
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get 'sign_up', to: 'users#new'
  get 'static_pages/help'
  resources :users
end

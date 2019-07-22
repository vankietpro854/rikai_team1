Rails.application.routes.draw do

  resources :suports, only: [:create, :destroy]
  resources :detail_courses
  resources :reports
  resources :sessions
  resources :chapters
  resources :cours
  root 'static_pages#home'
  get '/suport_new', to: 'suports#new'
  get '/home', to: 'static_pages#home'
  get '/info', to: 'static_pages#information'
  get '/info1', to: 'static_pages#support'
  get 'support', to: 'static_pages#support'
  get 'information', to: 'static_pages#information'
  get '/admin', to: 'static_pages#admin'
  get '/chapters', to: 'chapters#index'
  get 'sign_up',  to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  resources :users
end

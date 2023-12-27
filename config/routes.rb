Rails.application.routes.draw do


  # config/routes.rb
resources :ordem_servicos do
  collection do
    get 'search_veiculos'
  end
end

  resources :equipes
  resources :veiculos

  resources :mecanicos
  resources :pecas
  resources :servicos
  resources :clientes
  devise_for :users
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    get '/users/sign_in', to: 'devise/sessions#new'
    post '/users/sign_in', to: 'devise/sessions#create'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  get 'ordem_servicos/index'
  root 'ordem_servicos#index'
end

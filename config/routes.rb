Rails.application.routes.draw do

  resources :ordem_servicos do
    member do
      patch 'update_status'
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
  get 'pages/home'
  root 'pages#home'
end

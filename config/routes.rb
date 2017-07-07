Rails.application.routes.draw do

  devise_for :users
  root 'store#index', as: 'store'

  resources :tvshows, only: [:show, :index]
  resources :moods, only: [:show, :index]
  resources :users, only: [:show]
  resources :playlists
  resources :showlines, only: [:create]
  resources :orders, only: [:show]

  post 'playlists/:id/submit', to: 'playlists#submit', as: 'submit'

  get '/users/sign_out', to: 'store#index'
end

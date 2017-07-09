Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations', 
                                       :omniauth_callbacks => "omniauth_callbacks" }
  root 'store#index', as: 'store'

  resources :tvshows
  resources :moods
  resources :users, only: [:show, :index]
  resources :playlists
  resources :showlines, only: [:create]
  resources :orders, only: [:show]

  post 'playlists/:id/submit', to: 'playlists#submit', as: 'submit'
  
  

  get '/users/sign_out', to: 'store#index'
end


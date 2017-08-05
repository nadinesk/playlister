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


  resources :users do
    resources :playlists
  end

  resources :moods do
    resources :tvshows
  end

  namespace :admin do
    resources :stats, only: [:index]
  end

  post 'playlists/:id/submit', to: 'playlists#submit', as: 'submit'
  post 'tvshows/:id', to: 'tvshows#edit', as: 'edit'

  get '/users/sign_out', to: 'store#index'

end


Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations',  :omniauth_callbacks => "users/omniauth_callbacks"}

  
  
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'store#index', as: 'store'

  resources :tvshows
  resources :moods
  resources :users, only: [:show, :index]
  resources :playlists
  resources :showlines, only: [:create]
  resources :orders, only: [:show]

  get '/auth/facebook/callback' => 'sessions#create'

  post 'playlists/:id/submit', to: 'playlists#submit', as: 'submit'
  
  

  get '/users/sign_out', to: 'store#index'
end


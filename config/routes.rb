Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :worker_profiles do
    resources :worker_profile_tags, only: [:create] 
    resources :bookings, only: [:create]
    resources :availabilities, only: [:create]
  end

  get '/dashboard', to: 'dashboards#dashboard', as: 'dashboard'

  resources :bookings, only: [:show, :edit, :update, :destroy] do
    resources :payments, only: :new
    resources :reviews, only: [:create]
    member do
      patch :confirm
      patch :reject
    end

  end

  resources :worker_profile_tags, only: [:destroy]
  resources :availabilities, only: [:destroy]

end

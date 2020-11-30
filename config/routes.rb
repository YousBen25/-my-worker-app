Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :workers do
    resources :bookings, only: [:new, :create]
    resources :worker_tags, only: [:create]
    resources :availabilities, only: [:create]
  end

  resources :bookings, only: [:edit, :update, :destroy]

  get '/dashboard', to: 'dashboards#dashboard', as: 'dashboard'

  resources :bookings, only: [:show] do
    resources :reviews, only: [:create]
  end

  resources :worker_tags, only: [:destroy]
  resources :availabilities, only: [:destroy]

end

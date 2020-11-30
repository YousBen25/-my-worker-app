Rails.application.routes.draw do
  
  get 'availabilities/create'
  get 'reviews/create'
  get 'worker_tags/create'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :worker_profiles do
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

Rails.application.routes.draw do
  root 'flights#index'
  resources :bookings, only: [:new, :create, :show]
  resources :flights, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

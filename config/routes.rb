Rails.application.routes.draw do
  root 'flights#index'
  resources :bookings, only: [:new, :create, :show]
  resources :flights, only: [:index]
end

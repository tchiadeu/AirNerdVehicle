Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'vehicles/owner_vehicles/:id', to: "vehicles#owner_index", as: :owner_vehicles
  resources :vehicles, only: %i[index show new create edit update] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index show update]

  post 'bookings/:id', to: 'bookings#accept'
  # Defines the root path route ("/")
  # root "articles#index"
end

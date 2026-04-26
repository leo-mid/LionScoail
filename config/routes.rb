Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # All the resources
  resources :abouts
  resources :errors
  resources :relationships, only: [:create, :destroy]
  resources :disables

  # All resources with do and end
  resources :users do
    get :following, on: :member
    get :followers, on: :member
  end

  resources :posts do
    resources :comments
  end

  resources :conversations, only: [:index, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

  resources :rooms do
    resources :room_messages
  end

  get "disabled/lionnav", to: "disables#lionnav"
  get "disabled/social", to: "disables#lionsocial"
  get "post/following", to: "posts#following"
  get "rooms/joined", to: "rooms#joinedrooms"
  get "errors/resolved", to: "errors#resolve"

end
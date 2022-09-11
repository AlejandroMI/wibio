# frozen_string_literal: true

Rails.application.routes.draw do
  resources :links
  devise_scope :user do
    # Redirects signing out users back to home, fixing error when deleting user account
    get "users", to: "devise/sessions#new"
  end
  # Set devise for users, customizing through registration controller and with prefix to avoid collisions with user paths
  devise_for :users, controllers: { registrations: :registrations }, path_prefix: "d"

  # This is the main page for each user and their links
  get ':nickname', to: 'users#page', as: :user
  resources :users, only: [:update]
  get "welcome", to: "users#welcome"
  post "finish_welcome", to: "users#finish_welcome"

  # This should go always before the root page
  authenticated :user do
    root "links#index", as: :authenticated_root
  end

  root "pages#home"
end

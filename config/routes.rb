# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    # Redirects signing out users back to home, fixing error when deleting user account
    get "users", to: "devise/sessions#new"
  end
  # Set devise for users, customizing through registration controller and with prefix to avoid collisions with user paths
  devise_for :users, controllers: { registrations: :registrations }, path_prefix: "d"

  resources :users, only: [:update]
  get "welcome", to: "users#welcome"
  post "finish_welcome", to: "users#finish_welcome"

  authenticated :user do
    root "bio#edit", as: :authenticated_root
  end

  root "pages#home"
end

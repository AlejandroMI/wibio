# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Set devise for users, customizing through registration controller and with prefix to avoid collisions with user paths
  devise_for :users, controllers: { registrations: :registrations }, path_prefix: "d"

  resources :links

  # This is the main page for each user and their links
  get ":nickname", to: "users#page", as: :wibio_page

  resources :users, only: [:update]
  get "welcome", to: "users#welcome"
  post "finish_welcome", to: "users#finish_welcome"

  # This should go always before the root page
  authenticated :user do
    root "links#index", as: :authenticated_root
  end

  root "pages#home"
end

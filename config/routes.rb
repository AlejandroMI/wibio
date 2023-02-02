# frozen_string_literal: true

Rails.application.routes.draw do
  # Active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Set devise for users, customizing through registration controller and with prefix to avoid collisions with user paths
  devise_for :users, controllers: { registrations: :registrations }, path_prefix: "d"

  # This is the main page for each user and their links
  get ":nickname", to: "users#page", as: :wibio_page

  # All application routes
  # We isolate the application to /a to avoid collisions with user wibio pages
  scope "/a" do
    resources :links
    resources :users, only: [:update]
    get "welcome", to: "users#welcome"
    post "finish_welcome", to: "users#finish_welcome"
  end

  # This should go always before the root page
  authenticated :user do
    root "links#index", as: :authenticated_root
  end

  root "pages#home"
end

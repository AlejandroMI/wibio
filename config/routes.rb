Rails.application.routes.draw do
  devise_for :users
  get 'welcome', to: 'pages#welcome'
  root 'pages#home'
end

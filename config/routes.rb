Rails.application.routes.draw do
  get 'welcome', to: 'pages#welcome'
  root 'pages#home'
end

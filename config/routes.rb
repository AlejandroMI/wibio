Rails.application.routes.draw do
  get 'bio/edit'
  devise_for :users

  root 'pages#home'
end

Rails.application.routes.draw do
  get 'bio/edit'
  devise_for :users

  authenticated :user do
    root 'bio#edit', as: :authenticated_root
  end
  root 'pages#home'
end

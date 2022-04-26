Rails.application.routes.draw do
  get 'bio/edit'

  resources :users, only: [:update]

  # Fix error when deleting user account
  Rails.application.routes.draw do
    devise_scope :user do
      # Redirects signing out users back to sign-in
      get "users", to: "devise/sessions#new"
    end
    devise_for :users, :controllers => { :registrations => :registrations }
  end

  authenticated :user do
    root 'bio#edit', as: :authenticated_root
  end

  root 'pages#home'
end

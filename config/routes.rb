Rails.application.routes.draw do
  get 'bio/edit'

  Rails.application.routes.draw do
    devise_scope :user do
      # Redirests signing out users back to sign-in
      get "users", to: "devise/sessions#new"
    end
    devise_for :users
  end

  authenticated :user do
    root 'bio#edit', as: :authenticated_root
  end
  root 'pages#home'
end

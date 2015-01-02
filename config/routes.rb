Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"
  get 'dashboard', to: "dashboard#index"

  get '/auth/twitter/callback', to: "callbacks#twitter"
  get '/auth/facebook/callback', to: "callbacks#facebook"

  devise_for :users, :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

   devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
  end

end
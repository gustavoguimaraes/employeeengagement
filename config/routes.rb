Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  root to: "home#index"
  get 'dashboard', to: "users_dashboard#index"
  get 'post', to: "posts#new"
  get '/auth/twitter/callback', to: "callbacks#connect_social_media"
  get '/auth/facebook/callback', to: "callbacks#connect_social_media"
  get '/auth/linkedin/callback', to: "callbacks#connect_social_media"

  devise_for :users, :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

   devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
    get "register", to: "devise/registrations#new"
  end

end
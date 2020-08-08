Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :photos, :album
  get "/login/", to: "login#index"
  post "/login/", to: "login#handleLogin"
  get "/logout/", to: "logout#logout"
  get "/feeds/", to: "feeds#index"
  get "/discovery", to: "discovery#index"
  get "/profile/photos", to: "profile#phtos"
  get "/profile/albums", to: "profile#albums"
  get "/profile/followings", to: "profile#followings"
  get "/profile/followers", to: "profile#followers"

  namespace :admin do
    resources :photos, :albums, :users
  end
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :photos, :albums
  
  get "/login/", to: "logins#index"
  post "/login/", to: "logins#handleLogin"
  get "/logout/", to: "logout#logout"
  get "/discovery", to: "discovery#index"
  
  get "/profile/:id_user", to: "profiles#photos", as: :profiles
  get "/profile/albums/:id_user", to: "profiles#albums", as: :profiles_albums
  get "/profile/followings/:id_user", to: "profiles#followings", as: :profiles_followings
  get "/profile/followers/:id_user", to: "profiles#followers", as: :profiles_followers

  post "react/photo/:id_photo/:id_user", to: "reacts#react_photo", as: :react_photos
  put "react/photo/:id_photo/:id_user", to: "reacts#unreact_photo", as: :unreact_photos

  post "react/album/:id_album/:id_user", to: "reacts#react_album", as: :react_albums
  put "react/album/:id_album/:id_user", to: "reacts#unreact_album", as: :unreact_albums

  post "follows/:id_following/create", to: "follows#create", as: :follows_create
  post "follows/:id_following/destroy", to: "follows#destroy", as: :follows_destroy
  
  root to: "photos#index"
  namespace :admin do
    resources :photos, :albums, :users
  end
end

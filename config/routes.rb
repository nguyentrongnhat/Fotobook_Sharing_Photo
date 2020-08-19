Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :photos, :albums
  get "/login/", to: "logins#index"
  post "/login/", to: "logins#handleLogin"
  get "/logout/", to: "logout#logout"
  get "/feeds/", to: "photos#feeds", as: :feeds_photos
  get "/feeds/albums/", to: "albums#feeds", as: :feeds_albums
  get "/discovery", to: "discovery#index"
  get "/profile/photos", to: "profile#photos"
  get "/profile/albums", to: "profile#albums"
  get "/profile/followings", to: "profile#followings"
  get "/profile/followers", to: "profile#followers"
  get "feeds/album/:id/", to: "albums#show", as: :detail_newst

  get "react/photo/:id_photo/:id_user", to: "reacts#photo", as: :react_photos
  root to: "photos#index"
  namespace :admin do
    resources :photos, :albums, :users
  end
end

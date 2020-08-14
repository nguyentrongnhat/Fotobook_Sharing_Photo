Rails.application.routes.draw do
  get 'albums/index'
  get 'feed/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :photos, :albums
  get "/login/", to: "login#index"
  post "/login/", to: "login#handleLogin"
  get "/logout/", to: "logout#logout"
  get "/feeds/", to: "photos#feeds", as: :feeds_photos
  get "/feeds/albums/", to: "albums#feeds", as: :feeds_albums
  get "/discovery", to: "discovery#index"
  get "/profile/photos", to: "profile#phtos"
  get "/profile/albums", to: "profile#albums"
  get "/profile/followings", to: "profile#followings"
  get "/profile/followers", to: "profile#followers"
  get "feeds/album/:id/", to: "albums#show", as: :detail_newst

  namespace :admin do
    resources :photos, :albums, :users
  end
end

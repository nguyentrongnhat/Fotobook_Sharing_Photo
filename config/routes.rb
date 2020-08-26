Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "photos/feed", to: "photos#index_feed", as: :photos_feed
  get "albums/feed", to: "albums#index_feed", as: :albums_feed
  resources :photos, :albums

  put "users/update/:id", to: "users_update#update", as: :update_user_customs
  put "users/update/avatar/:id", to: "users_update#avatar", as: :update_user_avatar_customs

  delete "photos/destroy/:id", to: "photos#destroy", as: :destroy_photo
  
  get "/profile/:id_user", to: "profiles#photos", as: :profiles
  get "/profile/albums/:id_user", to: "profiles#albums", as: :profiles_albums
  get "/profile/followings/:id_user", to: "profiles#followings", as: :profiles_followings
  get "/profile/followers/:id_user", to: "profiles#followers", as: :profiles_followers
  
  get "/profile/edit/:id_user", to: "profiles#edit", as: :profiles_edit
  post "/profile/update/:id_user", to: "profiles#update", as: :profiles_update

  post "react/photo/:id_photo/:id_user", to: "reacts#react_photo", as: :react_photos
  put "react/photo/:id_photo/:id_user", to: "reacts#unreact_photo", as: :unreact_photos

  post "react/album/:id_album/:id_user", to: "reacts#react_album", as: :react_albums
  put "react/album/:id_album/:id_user", to: "reacts#unreact_album", as: :unreact_albums

  post "follows/:id_following/create", to: "follows#create", as: :follows_create
  post "follows/:id_following/destroy", to: "follows#destroy", as: :follows_destroy

  delete "albums/edit/destroy/:id_album/:id_photo", to: "albums#destroy_photo_from_album", as: :destroy_photo_from_album
  
  root to: "photos#index"
  namespace :admin do
    resources :photos, :albums, :users
  end
end

class ProfilesController < ApplicationController
	def albums
		@profile_user = User.find(params[:id_user])
		@albums = @profile_user.albums.all
		@cmp = current_user.follows.where(id_following: params[:id_user]).size
	end

	def photos
		@profile_user = User.find(params[:id_user])
		@photos = @profile_user.photos.all
		@cmp = current_user.follows.where(id_following: params[:id_user]).size
	end

	def followings
		@profile_user = User.find(params[:id_user])
		@followings = @profile_user.photos.all
		@cmp = current_user.follows.where(id_following: params[:id_user]).size
	end

	def followers
		@profile_user = User.find(params[:id_user])
		@followers = Follow.where(id_following: params[:id_user])
		@cmp = current_user.follows.where(id_following: params[:id_user]).size
	end
end

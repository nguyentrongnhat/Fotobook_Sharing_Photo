class ProfilesController < ApplicationController
	def albums
		check_login_to_redirect_login
		@profile_user = User.find(params[:id_user])
		@albums = @profile_user.albums.all
		@cmp = current_user.follows.where(id_following: params[:id_user]).size
		@followers = Follow.where(id_following: params[:id_user])
	end

	def photos

		check_login_to_redirect_login
		@profile_user = User.find(params[:id_user])
		@photos = @profile_user.photos.all
		@cmp = current_user.follows.where(id_following: params[:id_user]).size
		@followers = Follow.where(id_following: params[:id_user])
	end

	def followings
		check_login_to_redirect_login
		@profile_user = User.find(params[:id_user])
		@follows_record = @profile_user.follows.all

		@followings = Array.new
		@follows_record.each do |fr|
			@followings.push(User.find(fr.id_following))
		end

		@cmp = current_user.follows.where(id_following: params[:id_user]).size
		@followers = Follow.where(id_following: params[:id_user])
	end

	def followers
		check_login_to_redirect_login
		@profile_user = User.find(params[:id_user])
		@followers = Follow.where(id_following: params[:id_user])
		@cmp = current_user.follows.where(id_following: params[:id_user]).size
	end
end

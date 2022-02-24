class AlbumsController < ApplicationController
  	def index
  		check_login_to_redirect_login
	 	@albums = Album.order(created_at: :desc).where(status: true).page params[:page]
	end

	def index_feed
		if !user_signed_in?
	    	@albums = Album.order(created_at: :desc).where(status: true).page params[:page]
	    else
			@user = current_user
			@albums = Album.where(user_id: current_user.follows.select("id_following")).order(created_at: :desc).where(status: true).page params[:page]
		end
	end

	def new
		check_login_to_redirect_login
	    @user = current_user
	  	@album = @user.albums.new
	end

	def create
		require 'carrierwave/orm/activerecord'
	    check_login_to_redirect_login
	    @user = current_user
	  	@album = @user.albums.create param_permit_create
	  	if @album
	  		@photo = @user.photos.create param_permit_create
	  		@aps = @album.aps.create(album_id: @album.id, photo_id: @photo.id)
	  		puts "FUCKKKKKK"
	  		flash[:create_photo_sucess] = "create sucess fullly"
	     	redirect_to albums_path
	  	else
	  		render "new"
	  	end	
	end

	def show
		check_login_to_redirect_login
		@album = Album.find(params[:id])
		@aps = Ap.where(album_id: params[:id])
		@photos = Array.new
		@aps.each do |ap|
			@photos.push(Photo.find(ap.photo_id))
		end
	end

	def edit
		check_login_to_redirect_login
		@album = Album.find(params[:id])
		@photos = Array.new
  		@album.aps.each do |ap|
			@photos.push(Photo.find(ap.photo_id))
		end
	end

	def update
		check_login_to_redirect_login
		@album = Album.find(params[:id])
		if @album.update(param_permit_update)
			if params[:album][:source]!= nil
				@user = current_user
		  		@photo = @user.photos.create param_permit_create
		  		@aps = @album.aps.create(album_id: @album.id, photo_id: @photo.id)
		  		@photos = Array.new
		  		@album.aps.each do |ap|
					@photos.push(Photo.find(ap.photo_id))
				end
			end
	     	redirect_to edit_album_path(params[:id])
		else
			render "edit"
		end
	end

	def destroy_photo_from_album
		check_login_to_redirect_login
		Photo.where(id: params[:id_photo]).each do |photo|
			photo.destroy
		end
		@album = Album.find(params[:id_album])
		@photos = Array.new
  		@album.aps.each do |ap|
			@photos.push(Photo.find(ap.photo_id))
		end
		redirect_to edit_album_path(params[:id_album])
	end

	private
		def param_permit_create
			params.require(:album).permit(:title, :decription, :source, :status)
		end

		def param_permit_update
			params.require(:album).permit :title, :decription, :status
		end

		def param_permit_add_photo_to_album
			params.require(:album).permit :source
		end
end

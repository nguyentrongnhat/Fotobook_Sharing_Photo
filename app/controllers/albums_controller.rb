class AlbumsController < ApplicationController
  	def index
  		check_login
	 	@albums = Album.where(:status => true).order(created_at: :desc).limit(6)
	end

	def show
	  @album = Album.find(params[:id])
	  @aps = Ap.where(album_id: params[:id])
	  @photos = Array.new
	  @aps.each do |ap|
	    @photos.push(Photo.find(ap.photo_id))
	  end
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update(param_permit)
			flash[:notice] = "You have successfully logged out."
			redirect_to feeds_albums_path
		else
			render "edit"
		end
	end

	def check_login
	    if user_signed_in? == false
	      	redirect_to new_user_session_path
	    end
	end

	private
		def param_permit
			params.require(:album).permit(:title)
		end
end

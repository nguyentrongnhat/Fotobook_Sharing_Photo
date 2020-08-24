class PhotosController < ApplicationController
  def index
  	check_login
    @user = current_user
  	@photos = Photo.all.page params[:page]

  end


  def new
    check_login
    @user = current_user
  	@photo = @user.photos.new
  end

  def create
    require 'carrierwave/orm/activerecord'
    check_login
    @user = current_user
  	@photo = @user.photos.new param_permit
  	if @photo.save
  		flash[:ucess] = "create sucess fullly"
      redirect_to photos_path
  	else
  		render "new"
  	end	
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(param_permit)
      flash[:notice] = "Photo have successfully edit."
      redirect_to profiles_path(current_user.id)
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
      if(params[:source] == "")
        params.require(:photo).permit :title, :decription, :status
      else
        params.require(:photo).permit :title, :decription, :status, :source
      end
    end
end
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
    byebug
  	if @photo.save
  		flash[:create_photo_sucess] = "create sucess fullly"
      redirect_to photos_path
  	else
  		render "new"
  	end	
  end

  def check_login
    if user_signed_in? == false
      redirect_to new_user_session_path
    end
  end

  private
    def param_permit
      params.require(:photo).permit :title, :decription, :status, :source
    end
end
#doc lai strong parameter
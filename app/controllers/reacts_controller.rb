class ReactsController < ApplicationController
  def react_photo
  	#@photos = params[:photos]
    @user = User.find(params[:id_user])
    @photo = Photo.find(params[:id_photo])
    @react = @photo.reacts.create(user_react: @user.id, reactable_id: @photo.id)
    redirect_to photos_path
  end

  def unreact_photo
  	#@photos = params[:photos]
    @user = User.find(params[:id_user])
    @photo = Photo.find(params[:id_photo])
    @react = @photo.reacts.where(user_react: @user.id, reactable_id: @photo.id).first
    @react.destroy
    redirect_to photos_path
  end

  def react_album
    #@photos = params[:photos]
    @user = User.find(params[:id_user])
    @album = Album.find(params[:id_album])
    @react = @album.reacts.create(user_react: @user.id, reactable_id: @album.id)
    redirect_to albums_path
  end

  def unreact_album
    #@photos = params[:photos]
    @user = User.find(params[:id_user])
    @album = Album.find(params[:id_album])
    @react = @album.reacts.where(user_react: @user.id, reactable_id: @album.id).first
    @react.destroy
    redirect_to albums_path
  end
end

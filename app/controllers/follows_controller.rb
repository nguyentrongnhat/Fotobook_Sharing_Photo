class FollowsController < ApplicationController
  def create
  	current_user.follows.create(user_id: current_user.id, id_following: params[:id_following])
  	redirect_back(fallback_location: root_path)
  end

  def destroy
  	@followings = current_user.follows.where(id_following: params[:id_following])
  	@followings.each do |following|
  		following.destroy
  	end
  	redirect_back(fallback_location: root_path)
  end
end

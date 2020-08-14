class PhotosController < ApplicationController
  def feeds
  	@photos = Photo.all
  end
end

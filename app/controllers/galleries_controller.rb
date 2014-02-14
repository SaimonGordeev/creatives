class GalleriesController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.gallery.nil?
      temp = Gallery.new
      temp.user = current_user
      temp.save
      current_user.gallery = temp
      current_user.save
    else
      temp = current_user.gallery
    end
    @images = temp.images
  end
end

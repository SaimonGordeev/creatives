class ImagesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    image.gallery = current_user.gallery
    if image.save
      redirect_to gallery_path, notice: 'Image was successfully upload.'
    else
      render action: 'new'
    end
  end

  private
    def image_params
      params.require(:image).permit(:path)
    end
end

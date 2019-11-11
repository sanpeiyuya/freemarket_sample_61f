class ImagesController < ApplicationController

  def edit_destroy
    @image = Image.find(params[:image_id])
    @image.destroy
  end

end

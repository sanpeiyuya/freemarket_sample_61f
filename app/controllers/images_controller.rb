class ImagesController < ApplicationController

  def edit_destroy
    num = 1
    params[:delete_image_ids].each do |id|
      @image = Image.find(id.to_i)
      if @image.destroy && num == params[:delete_image_ids].length
        respond_to do |format|
          @environment = Rails.env
          format.json { @environment }
        end
      end
      num += 1
    end
  end

end

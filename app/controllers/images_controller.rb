class ImagesController < ApplicationController

  def edit_destroy
    @environment = Rails.env
    # 消す画像があれば、消す処理を実行
    if params[:delete_image_ids].present?
      num = 1
      params[:delete_image_ids].each do |id|
        @image = Image.find(id.to_i)
        if @image.destroy && num == params[:delete_image_ids].length
          respond_to do |format|
            format.json { @environment }
          end
        end
        num += 1
      end
    # 消す画像がなければ、抜ける
    else
      respond_to do |format|
        format.json { @environment }
      end
    end
  end

end

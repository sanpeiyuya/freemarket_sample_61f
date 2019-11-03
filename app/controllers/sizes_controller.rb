class SizesController < ApplicationController
  def search
    size_id = Category.find(params[:category_id]).size_id
    # size_idがnullなら、@sizeを空にする
    @sizes = Size.where(ancestry: size_id) unless size_id == nil
    respond_to do |format|
      format.html
      format.json {
        @sizes
      }
    end
  end
end

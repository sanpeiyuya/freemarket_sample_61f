class BrandsController < ApplicationController
  def search
    @brands = Brand.where("name LIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json {
        @brands
      }
    end
  end
end

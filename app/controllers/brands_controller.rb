class BrandsController < ApplicationController

  def enter
    @brand_check = Category.find(params[:category_id]).brand
    respond_to do |format|
      format.html
      format.json {
        @brand_check
      }
    end
  end

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

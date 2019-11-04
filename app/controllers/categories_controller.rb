class CategoriesController < ApplicationController

  def search_level1
    @categories = Category.where(ancestry: params[:category_id])
    respond_to do |format|
      format.html
      format.json {
        @categories
      }
    end
  end

  def search_level2
    category_1 = params[:category_id].to_s
    category_2 = params[:category2_id].to_s
    @categories = Category.where("ancestry LIKE '#{category_1}/#{category_2}'")
    respond_to do |format|
      format.html
      format.json {
        @categories
      }
    end
  end
end

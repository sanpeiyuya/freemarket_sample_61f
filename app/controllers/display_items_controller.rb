class DisplayItemsController < ApplicationController
  def new
    @display_item = DisplayItem.new
    @display_item.images.build
    # カテゴリ取得
    @categories = Category.where(ancestry: nil)
    @sizes = Size.where(ancestry: nil)
    @brands = Brand.all
    @conditions = Condition.all
    @delivery_fee_burdens = DeliveryFeeBurden.all
    @delivery_methods = DeliveryMethod.all
    @prefectures = Prefecture.all
    @delivery_by_days = DeliveryByDay.all
  end

  def create
    @display_item = DisplayItem.new(display_item_params)
    if @display_item.save
      redirect_to root_path
    else
    end
  end

  def first_category_search
    @categories = Category.where(ancestry: params[:category_id])
    respond_to do |format|
      format.html
      format.json {
        @categories
      }
    end
  end

  def second_category_search
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

  private
  def display_item_params
    params.require(:display_item).permit(:user_id, :name, :description, :category_id, :size_id, :brand_id, :condition_id, :delivery_fee_burden_id, :delivery_method_id, :prefecture_id, :delivery_by_day_id, :price, images_attributes: [:image])
  end
end

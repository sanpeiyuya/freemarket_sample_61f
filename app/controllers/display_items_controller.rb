class DisplayItemsController < ApplicationController

  require "date"

  def index
    @display_item = DisplayItem.new
    @display_items = DisplayItem.limit(10).order(id: "DESC")
  end

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

  def show

    @display_item = DisplayItem.find(params[:id])
    @category_lv1 = @display_item.category
    @category_lv2 = @category_lv1.parent
    @category_lv3 = @category_lv2.parent if @category_lv2.parent

    @comment = Comment.new
    @comments = @display_item.comments

    @now = Time.now

    @mine_items = DisplayItem.where(user_id: @display_item[:user_id])
    @same_category_items = DisplayItem.where(category_id: @display_item[:category_id])

    # 必ず最後に入れる
    render :layout => 'display_items_show'
  end

  def buy
    
  end

  private
  def display_item_params
    # brand_idが名前で入っているため、idに変換
    params[:display_item][:brand_id] = Brand.find_by(name: params[:display_item][:brand_id]).id
    params.require(:display_item).permit(:user_id, :name, :description, :category_id, :size_id, :brand_id, :condition_id, :delivery_fee_burden_id, :delivery_method_id, :prefecture_id, :delivery_by_day_id, :price, images_attributes: [:image])
  end
end

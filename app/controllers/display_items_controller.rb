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

  # サイズの取得
  def size_search
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
  # ブランドの検索
  def brand_search
    @brands = Brand.where("name LIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json {
        @brands
      }
    end
  end  

  private
  def display_item_params
    # brand_idが名前で入っているため、idに変換
    params[:display_item][:brand_id] = Brand.find_by(name: params[:display_item][:brand_id]).id
    params.require(:display_item).permit(:user_id, :name, :description, :category_id, :size_id, :brand_id, :condition_id, :delivery_fee_burden_id, :delivery_method_id, :prefecture_id, :delivery_by_day_id, :price, images_attributes: [:image])
  end
end

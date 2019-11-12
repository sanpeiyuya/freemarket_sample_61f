class DisplayItemsController < ApplicationController

  require "date"

  def index
    @find_items = DisplayItem.order(id: "DESC")
    @display_items = []

    @find_items.each do |item|
      if @display_items.length < 11
        unless item.stopping_item
          @display_items << item
        end
      else
        break
      end
    end

    # カテゴリーを取得
    @categories = Category.where(ancestry: nil)
    
  end

  def new
    @display_item = DisplayItem.new
    @display_item.images.build
    # カテゴリ取得
    get_select_options

  end

  def create
    @display_item = DisplayItem.new(display_item_params)
    # イメージが存在しない時は登録させない
    if display_item_params[:images_attributes] && @display_item.save
      redirect_to root_path
    else
      # カテゴリ取得
      get_select_options
      # newページに戻す
      render action: :new
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

  def edit
    @display_item = DisplayItem.find(params[:id])
    @images = @display_item.images
    # カテゴリ取得
    get_select_options



    # edit用の変数取得
    # カテゴリー
      # 初期値を取得
      if @display_item.category.parent.parent
        @category_lv1_id = @display_item.category.parent.parent.id
        @category_lv2_id = @display_item.category.parent.id
        @category_lv3_id = @display_item.category_id

        @category_lv2_groups = @display_item.category.parent.parent.children
        @category_lv3_groups = @display_item.category.parent.children
      else
      end




      # 配送方法
    if @display_item.delivery_fee_burden_id == 1
      @delivery_methods = DeliveryMethod.where(type: 3)
    else
      @delivery_methods = DeliveryMethod.where(type: 1)
    end
  end

  def update
    @display_item = DisplayItem.find(params[:id])
    @display_item.update(display_item_params)
  end

  def destroy
    @display_item = DisplayItem.find(params[:id])
    if @display_item.destroy
      redirect_to display_items_mypages_path
    end
  end

  def buy
    @display_item = DisplayItem.find(params[:id])
    @trading_item = TradingItem.new
  end

  private
  def display_item_params
    # brand_idが名前で入っているためidに変換、見つからない時はnullを入れる
    if Brand.find_by(name: params[:display_item][:brand_id])
      params[:display_item][:brand_id] = Brand.find_by(name: params[:display_item][:brand_id]).id
    else
      params[:display_item][:brand_id] = nil
    end
    params.require(:display_item).permit(:user_id, :name, :description, :category_id, :size_id, :brand_id, :condition_id, :delivery_fee_burden_id, :delivery_method_id, :prefecture_id, :delivery_by_day_id, :price, images_attributes: [:image])
  end

  def get_select_options
    @categories = Category.where(ancestry: nil)
    @sizes = Size.where(ancestry: nil)
    @brands = Brand.all
    @conditions = Condition.all
    @delivery_fee_burdens = DeliveryFeeBurden.all
    @delivery_methods = DeliveryMethod.all
    @prefectures = Prefecture.all
    @delivery_by_days = DeliveryByDay.all
  end
end

class DisplayItemsController < ApplicationController
  before_action :find_display_item, only: [:show, :destroy, :edit]

  require "date"

  def index
    # カテゴリーを取得
    @lady = Category.find_by(name: "レディース")
    @man = Category.find_by(name: "メンズ")
    @electrical = Category.find_by(name: "家電・スマホ・カメラ")
    @hobby = Category.find_by(name: "おもちゃ・ホビー・グッズ")
 
    # カテゴリをまとめて配列に保存
    @categories = [@lady, @man, @electrical, @hobby]

    @items = DisplayItem.order('created_at DESC')
    @ladies = []
    @mens = []
    @electricals = []
    @hobies = []

    @items.each do |item|
      if item.stopping_item.nil? && 
        if item.category.parent.parent_id == @lady.id && @ladies.length < 10
          @ladies << item
        elsif item.category.parent.parent_id == @man.id && @mens.length < 10
          @mens << item
        elsif item.category.parent.parent_id == @electrical.id && @electricals.length < 10
          @electricals << item
        elsif item.category.parent.parent_id == @hobby.id && @hobies.length < 10
          @hobies << item
        elsif @ladies == 10 && @mens == 10 && @electricals == 10 && @hobies == 10
          break
        end
      end
    end


  end

  def new
    @display_item = DisplayItem.new
    @display_item.images.build
    # セレクトボックスの中身を取得
    get_select_box_contents
  end

  def create
    @display_item = DisplayItem.new(display_item_params)
    # イメージが存在しない時は登録させない
    if display_item_params[:images_attributes] && @display_item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      # セレクトボックスの中身を取得
      get_select_box_contents
      # newページに戻す
      render action: :new
    end
  end

  def show
    # show用の変数取得
    get_show_variables
    # 必ず最後に入れる
    render :layout => 'display_items_show'
  end

  def edit
    @images = @display_item.images
    # セレクトボックスの中身を取得
    get_select_box_contents
    # edit用の初期情報を取得
    get_edit_variables
  end

  def update
    @display_item = DisplayItem.find(params[:id])
    if @display_item.update(display_item_params)
      redirect_to display_item_path(params[:id]), notice: '商品を編集しました'
    else
      redirect_to edit_display_item_path(params[:id]), alert: '編集に失敗しました'
    end
  end

  def destroy
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
    # size_idがないときは、nullで入力する
    unless params[:display_item][:size_id]
      params[:display_item][:size_id] = nil
    end
    params.require(:display_item).permit(:user_id, :name, :description, :category_id, :size_id, :brand_id, :condition_id, :delivery_fee_burden_id, :delivery_method_id, :prefecture_id, :delivery_by_day_id, :price, images_attributes: [:image, :id, :_destroy])
  end

  def find_display_item
    @display_item = DisplayItem.find(params[:id])
  end

  def get_select_box_contents
    @categories = Category.where(ancestry: nil)
    @sizes = Size.where(ancestry: nil)
    @brands = Brand.all
    @conditions = Condition.all
    @delivery_fee_burdens = DeliveryFeeBurden.all
    @delivery_methods = DeliveryMethod.all
    @prefectures = Prefecture.all
    @delivery_by_days = DeliveryByDay.all
  end

  def get_show_variables
    # カテゴリ系
    @category_lv1 = @display_item.category
    @category_lv2 = @category_lv1.parent
    @category_lv3 = @category_lv2.parent if @category_lv2.parent
    # コメント生成
    @comment = Comment.new
    # コメントを取得、コメント時間算出用の時間取得
    @comments = @display_item.comments
    @now = Time.now
    # 次のアイテム、前のアイテム取得
    @mine_items = DisplayItem.where(user_id: @display_item[:user_id])
    @same_category_items = DisplayItem.where(category_id: @display_item[:category_id])
  end

  def get_edit_variables
    # カテゴリー
    if @display_item.category.parent.parent
      @category_lv1_id = @display_item.category.parent.parent.id
      @category_lv2_id = @display_item.category.parent.id
      @category_lv3_id = @display_item.category_id

      @category_lv2_group = @display_item.category.parent.parent.children
      @category_lv3_group = @display_item.category.parent.children
    else
      @category_lv1_id = @display_item.category.parent.id
      @category_lv2_id = @display_item.category_id

      @category_lv2_group = @display_item.category.parent.children
    end
    # サイズ
    if @display_item.size
      @size_id = @display_item.size_id
      @size_groups = @display_item.size.parent.children
    end
    # ブランド
    if @display_item.brand
      @brand_name = @display_item.brand.name
    end
    # 配送方法
    if @display_item.delivery_fee_burden_id == 1
      @delivery_methods = DeliveryMethod.where(type: 3)
    else
      @delivery_methods = DeliveryMethod.where(type: 1)
    end
  end

end

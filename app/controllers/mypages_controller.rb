class MypagesController < ApplicationController
  def index
    # @profile = UserProfile.find_by(user_id: current_user.id)
    @display_item = DisplayItem.new
  end
  # 商品削除機能（このコメントは後で消す）
  def display_items
    @items = current_user.display_items
    @display_items = []
    @items.each do |item|
      if item.trading_item.nil? && item.finished_item.nil? 
        @display_items << item
      end
    end
  end
  # 商品削除機能（このコメントは後で消す）
  def trading_items
  end

  def finished_items
  end

  def logout
    @display_item = DisplayItem.new
  end
  
end

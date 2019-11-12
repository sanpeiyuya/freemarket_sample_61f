class MypagesController < ApplicationController
  def index
    # @profile = UserProfile.find_by(user_id: current_user.id)
    @display_item = DisplayItem.new
  end
  # 商品削除機能（このコメントは後で消す）
  def display_items
    @display_items = DisplayItem.where(user_id: current_user.id)
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

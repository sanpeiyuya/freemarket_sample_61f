class TradingItemsController < ApplicationController

  def create
    @trading_item = TradingItem.new(trading_item_params)
    if @trading_item.save
      redirect_to root_path
    else
      render action: :buy
    end
  end

  private
  def trading_item_params
    params.require(:trading_item).permit(:user_id, :display_item_id)
  end

end

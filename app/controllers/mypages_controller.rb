class MypagesController < ApplicationController
  def index
    @display_item = DisplayItem.new
  end

  def display_items
    @items = current_user.display_items
    @display_items = @items.select { |item| item.trading_item.nil? && item.finished_item.nil? }
  end

  def trading_items
    @items = current_user.display_items
    @has_trading_items = @items.select { |item| item.trading_item && item.finished_item.nil? }
  end

  def finished_items
  end

  def logout
    @display_item = DisplayItem.new
  end
  
end

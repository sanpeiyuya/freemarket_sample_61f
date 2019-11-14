class MypagesController < ApplicationController
  def index
    @display_item = DisplayItem.new
  end

  def display_items
    @items = current_user.display_items
    @display_items = []
    @items.each do |item|
      if item.trading_item.nil? && item.finished_item.nil? 
        @display_items << item
      end
    end
  end

  def trading_items
    @items = current_user.display_items
    @trading_items = []
    @items.each do |item|
      if item.trading_item && item.finished_item.nil? 
        @trading_items << item.trading_item
      end
    end
  end

  def finished_items
  end

  def logout
    @display_item = DisplayItem.new
  end
  
end

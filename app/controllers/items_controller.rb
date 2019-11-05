class ItemsController < ApplicationController

  def index
    @display_item = DisplayItem.new
    @display_items = DisplayItem.limit(10).order(id: "DESC")
  end

  def search
    @items = Item.where('title LIKE(?)', "%#{params[:keyword]}%")
  end
end

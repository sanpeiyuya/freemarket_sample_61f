class ItemsController < ApplicationController

  def index
    @display_item = DisplayItem.new
  end

  def search
    @items = Item.where('title LIKE(?)', "%#{params[:keyword]}%")
  end
end

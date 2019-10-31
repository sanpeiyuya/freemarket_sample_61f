class ItemsController < ApplicationController

  def index

  end
  def search
    @items = Item.where('title LIKE(?)', "%#{params[:keyword]}%")
  end
end

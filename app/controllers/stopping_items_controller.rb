class StoppingItemsController < ApplicationController

  def create
    @stopping_item = StoppingItem.new(display_item_id: params[:format])
    if @stopping_item.save
      redirect_to display_items_mypages_path
    else
    end
  end

  def destroy
    @stopping_item = StoppingItem.find_by(display_item_id: params[:id])
    if @stopping_item.destroy
      redirect_to display_items_mypages_path
    else
    end
  end

end

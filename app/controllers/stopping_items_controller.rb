class StoppingItemsController < ApplicationController

  def create
    @stopping_item = StoppingItem.new(display_item_id: params[:format])
    if @stopping_item.save
      redirect_to display_item_path(params[:format]), notice: '出品を停止しました'
    else
      redirect_to display_item_path(params[:format]), alert: '出品の停止に失敗しました'
    end
  end

  def destroy
    @stopping_item = StoppingItem.find_by(display_item_id: params[:id])
    if @stopping_item.destroy
      redirect_to display_item_path(params[:id]), notice: '出品を再開しました'
    else
      redirect_to display_item_path(params[:id]), alert: '出品の再開に失敗しました'
    end
  end

end

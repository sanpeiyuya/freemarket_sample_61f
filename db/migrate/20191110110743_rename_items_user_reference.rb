class RenameItemsUserReference < ActiveRecord::Migration[5.0]
  def change
    rename_column :trading_items, :buyer_id, :user_id
    rename_column :finished_items, :buyer_id, :user_id
  end
end

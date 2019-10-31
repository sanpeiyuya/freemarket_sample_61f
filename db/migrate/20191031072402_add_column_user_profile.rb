class AddColumnUserProfile < ActiveRecord::Migration[5.0]
  def up
    add_column :user_profiles :nickname, :string
  end
end

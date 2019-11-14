class UserAddProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :family_name, :string
    add_column :users, :given_name, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :given_name_kana, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
    add_column :users, :nickname, :string
    add_column :users, :introduction, :text
    add_column :users, :icon_image, :text
    add_column :users, :total_sales, :integer
  end
end

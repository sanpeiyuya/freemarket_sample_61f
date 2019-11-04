class AddBrandToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :brand, :integer
  end
end

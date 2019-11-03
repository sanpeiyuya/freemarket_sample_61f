class AddNameAlphabetToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :name_alphabet, :string
  end
end

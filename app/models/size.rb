class Size < ApplicationRecord
  has_many :categories, dependent: :delete_all

  has_ancestry

  has_many :display_items, dependent: :delete_all
end

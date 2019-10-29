class Category < ApplicationRecord
  belongs_to :size

  has_ancestry

  has_many :display_items, dependent: :delete_all
end

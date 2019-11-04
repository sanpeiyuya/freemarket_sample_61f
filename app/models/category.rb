class Category < ApplicationRecord
  belongs_to :size, optional: true

  has_ancestry

  has_many :display_items, dependent: :delete_all
end

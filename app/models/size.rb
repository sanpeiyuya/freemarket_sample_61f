class Size < ApplicationRecord
  has_many :categories, dependent: :delete_all
  has_ancestry
end

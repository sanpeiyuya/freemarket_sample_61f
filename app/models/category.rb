class Category < ApplicationRecord
  belongs_to :size
  has_ancestry
end

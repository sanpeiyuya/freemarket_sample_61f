class Comment < ApplicationRecord
  belongs_to :display_item
  belongs_to :user
end

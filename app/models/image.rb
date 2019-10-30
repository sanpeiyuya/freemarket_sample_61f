class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :display_item, optional: true
end

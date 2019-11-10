class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  # バリデーション
  validates :image,    presence: true

  belongs_to :display_item, optional: true
end

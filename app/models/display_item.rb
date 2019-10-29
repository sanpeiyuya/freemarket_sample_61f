class DisplayItem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee_burden
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :delivery_by_day

  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :brand

end

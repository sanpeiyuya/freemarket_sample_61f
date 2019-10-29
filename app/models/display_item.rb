class DisplayItem < ApplicationRecord
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee_burden
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :delivery_by_day
end

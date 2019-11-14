FactoryBot.define do
  factory :display_item do
    name {"テスト"}
    description {"テスト用のデータです"}
    price {1000}
    category_id {56}
    size_id {109}
    brand_id {10}
    condition_id {1}
    delivery_fee_burden_id {1}
    delivery_method_id {1}
    prefecture_id {1}
    delivery_by_day_id {1}
    user_id {1}
    created_at {2019/11/11}
    updated_at {2019/11/12}
  end
end
FactoryBot.define do
  factory :display_item do
    name                     {"テスト太郎"}
    description              {"テスト用のデータです"}
    price                    {3000}
    category_id              {1}
    size_id                  {1}
    brand_id                 {1}
    condition_id             {1}
    delivery_fee_burden_id   {1}
    delivery_method_id       {1}
    prefecture_id            {1}
    delivery_by_day_id       {1}
    user_id                  {1}
  end
end
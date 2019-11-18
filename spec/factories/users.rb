FactoryBot.define do
  factory :user do
    id                           {1}
    phone                        {"00000000000"}
    email                        {"aaa@aaa"}
    created_at                   {"2019/11/11"}
    updated_at                   {"2019/11/12"}
    family_name                  {"a"}
    given_name                   {"a"}
    family_name_kana             {"a"}
    given_name_kana              {"a"}
    birth_year                   {1}
    birth_month                  {1}
    birth_day                    {1}
    nickname                     {"aaa"}
    introduction                 {"a"}
    icon_image                   {"a"}
    total_sales                  {1}
    password                     {"00000000"}
    password_confirmation        {"00000000"}
  end
end
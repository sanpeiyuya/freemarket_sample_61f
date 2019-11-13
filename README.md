# README
![ER_free-marcket (4)](https://user-images.githubusercontent.com/12472994/68737559-2572e780-0627-11ea-897d-53bbd86d8882.png)

## テーブル
- users
- addresses
- credit_cards
- sns_credentials
- display_items
- trading_items
- finished_items
- images
- categories
- sizes
- blands
- comments
- trade_messages
- likes

## テーブル詳細
### _users_
|カラム名|型|オプション|備考|
|---|---|---|---|
|email|string|null: false, unique: true||
|password|string|null: false|一意性なし|
|phone|string|null: false, unique: true||
|family_name|string|null:false|　|
|given_name|string|null:false|　|
|family_name_kana|string|null:false|　|
|given_name_kana|string|null:false|　|
|introduction|text|　|　|
|birth_year|intger|null:false|　|
|birth_month|intger|null:false|　|
|birth_day|intger|null:false|　|
|icon_image|text|　|　|
|total_sales|intger|　|トータルの投稿数|

#### アソシエーション
- has_one :address, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :sns_credential, dependent: :destroy
- has_many :display-items
- has_many :trading_items
- has_many :finished_items
- has_many: comments
- has_many: trade-messages
- has_many :likes

### _addresses_
|カラム名|型|オプション|備考|
|---|---|---|---|
|user_id|references|foreign_key: true|　|
|postal_code|string|null:false|　|
| prefecture_id |integer|null:false|active_hashで管理|
| city |string|null:false|市区町村|
| block |string|null:false|番地|
| building |string|　|建物名|
| phone |string|　|電話番号、桁数的にstring|
#### アソシエーション
- belongs_to :user

### _credit_cards_
|カラム名|型|オプション|備考|
|---|---|---|---|
|user_id|references|foreign_key: true|　|
|customer_id|string|null:false, unique: true|payjpのカスタマーID|
|card_id|string|null:false, unique: true|payjpのカード番号に紐づくID|
#### アソシエーション
- belongs_to :user

### _sns_credentials_
|カラム名|型|オプション|備考|
|---|---|---|---|
|user_id|references|foreign_key: true|　|
|uid|string|null: false, unique: true|今の所カラムだけ用意|
|provider|string|null: false|今の所カラムだけ用意|
#### アソシエーション
- belongs_to :user

### _display_items_
|カラム名|型|オプション|備考|
|---|---|---|---|
|name|string|null: false, index:true|一意性削除|
|description|text|null: false|　|
|price|integer|null: false|　|
|category_id|references|foreign_key:true|　|
|brand_id|references|foreign_key:true|　|
|condition_id|integer|null:false, foreign_key: true|active_hashで管理、カラム名は任意でつける|
|delivery_fee_burden_id|integer|null:false, foreign_key: true|active_hashで管理、カラム名は任意でつける|
|delivery_method_id|integer|null:false, foreign_key: true|active_hashで管理、カラム名は任意でつける|
|prefecture_id|integer|null:false, foreign_key: true|active_hashで管理、カラム名は任意でつける|
|delivery_by_day_id|integer|null:false, foreign_key: true|active_hashで管理、カラム名は任意でつける|
|user_id|references|null:false, foreign_key: true|　|
|size_id|references|foreign_key: true|　|
#### アソシエーション
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :condition
- belongs_to :delivery_fee_burden
- belongs_to :delivery_method
- belongs_to :delivery_prefecture
- belongs_to :delivery_by_day
- belongs_to :size
- has_one :trading_item, dependent: :destroy
- has_one :finished_item, dependent: :destroy
- has_one :stopping_item, dependent: :destroy
- has_many :images, dependent: :destroy_all
- has_many: messages
- has_many :likes

### _trading_items_
|カラム名|型|オプション|備考|
|---|---|---|---|
|display_item_id|integer|null:false, foreign_key: true|　|
|buyer_id|references|foreign_key: true|カラム名は任意でつける|
#### アソシエーション
- belongs_to :user
- belongs_to :_display_item

### _finished_items_
|カラム名|型|オプション|備考|
|---|---|---|---|
|display_item_id|integer|null:false, foreign_key: true|　|
|buyer_id|references|foreign_key: true|カラム名は任意でつける|
#### アソシエーション
- belongs_to :user
- belongs_to :_display_item
- has_many: trade_messages

### _stopping_items_
|カラム名|型|オプション|備考|
|---|---|---|---|
|display_item_id|integer|null:false, foreign_key: true|　|
#### アソシエーション
- belongs_to :_display_item

### _images_
|カラム名|型|オプション|備考|
|---|---|---|---|
|image|string|null:false|　|
|display_item_id|references|foreign_key: true|　|
#### アソシエーション
- belongs_to :_display_item

### _categories_
|カラム名|型|オプション|備考|
|---|---|---|---|
|name|string|null: false|　|
|ancestry|string|　|gem'ancestry'を使用|
|size_id|references|foreign_key: true|　|
|brand|string|　|ブランドの有無を判定、1ならブランド有り|
#### アソシエーション
- has_many :display_items
- belongs_to :size

### _sizes_
|カラム名|型|オプション|備考|
|---|---|---|---|
|size|string|null: false|　|
|ancestry|string|　|gem'ancestry'を使用|
#### アソシエーション
- has_many :display_items
- has_many :categolies

### _blands_
|カラム名|型|オプション|備考|
|---|---|---|---|
|name|string|null: false|　|
|name_alphabet|string|null: false|　|
|name_kana|string|null: false|　|
#### アソシエーション
- has_many :display_items

### _comments_
|カラム名|型|オプション|備考|
|---|---|---|---|
|comment|text|　|　|
|display_item_id|references|null: false, foreign_key: true|　|
|user_id|references|null: false, foreign_key: true|　|
#### アソシエーション
- belongs_to :user
- belongs_to :display_item

### _trade_messages_
|カラム名|型|オプション|備考|
|---|---|---|---|
|message|text|　|　|
|finished_item_id|references|null: false, foreign_key: true|　|
|user_id|references|null: false, foreign_key: true|　|
#### アソシエーション
- belongs_to :user
- belongs_to :finished_item

### _likes_
|カラム名|型|オプション|備考|
|---|---|---|---|
| display_item_id |references|null:false, foreign_key:true|　|
|user_id |references|null:false, foreign_key:true|　|
#### アソシエーション
- belongs_to :user
- belongs_to :display_item

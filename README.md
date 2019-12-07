# メルカリ　クローン DB設計
## ユーザーテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false|
|password|string|null: false|
|birthday|integer|null: false|
|address|string|null: false|
|phone_number|integer|null: false|
|profile|string|
|credit_card_id|integer|null: false, foreign_key: true|
|sell_products|string|
|buy_products|string|

### Association
- has_many :products
- has_many :comments

## クレジットカード情報テーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|use_limit|integer|null: false|
|security_code|integer|null: false|


## 商品テーブル
|Column|Type|Options|
|------|----|-------|
|product_name|text|null: false|
|text|text|null: false|
|l_category_id|string|null: false, foreign_key: true|
|m_category_id|string|null: false, foreign_key: true|
|s_category_id|string|null: false, foreign_key: true|
|product_photo_id|string｜null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|price|integer|null: false|
|product_size|string|
|condition|string|null :false|
|shipping_charge|string|
|shipping_method|string|
|delivery_area|string|null :false|
|user_id|integer|null: false, foreign_key: true|
|comment_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags

## コメントテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :products

## 大カテゴリテーブル
|Column|Type|Options|
|------|----|-------|
|l_category_name|string|null: false|
|l_category_id|integer|null: false|
|m_category_id|integer|null: false, foreign_key: true|
|s_category_id|integer|null: false, foreign_key: true|

### Association
- has_many :m_category

## 中カテゴリテーブル
|Column|Type|Options|
|------|----|-------|
|m_category_name|string|null: false|
|m_category_id|integer|null: false|
|s_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :l_category
- has_many :s_category

## 小カテゴリテーブル
|Column|Type|Options|
|------|----|-------|
|s_category_name|string|null: false|
|s_category_id|integer|null: false|

### Association
- belongs_to :m_category

### ブランド(メーカー)テーブル
|Column|Type|Options|
|------|----|-------|
|bland_name|string|
|bland_id|integer|null :false|
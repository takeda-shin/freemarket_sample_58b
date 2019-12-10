# メルカリ　クローン DB設計
## ユーザーテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null :false|
|family_name_kana|string|null :false|
|first_name|string|null :false|
|first_name_kana|string|null :false|
|email|string|null: false|
|password|string|null: false|
|birthday|integer|null: false|
|address_id|string|null: false|
|phone_number|string|unique:true|
|profile|string|
|credit_card_id|integer|null: false|
|product_id|integer|null :false|

### Association
- has_many :products　
- has_many :comments, :dependent => :destroy

## 住所テーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null :false|
|perfectures|string|null :false|
|city|string|null :false|
|address|string|null :false|
|building|string|null :false|

### Association
- belongs_to :user

## クレジットカード情報テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false|
|card_number|integer|null: false|
|use_limit|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user


## 商品テーブル
|Column|Type|Options|
|------|----|-------|
|product_name|text|null: false|
|text|text|null: false|
|category_id|string|null: false, foreign_key: true|
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
- has_many :comments, :dependent => :destroy
- has_many :category

## コメントテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :products

## カテゴリテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|category_id|integer|null: false|
|size_id|reference|null :false, foreign_key: true|

### Association
has_many :blands
has_many :products
has_one :category_size

## カテゴリのサイズテーブル
|Column|Type|Options|
|------|----|-------|
|size_id|integer|null: false|
|size|string|


### ブランド(メーカー)テーブル
|Column|Type|Options|
|------|----|-------|
|bland_name|string|
|bland_id|integer|null :false|

### Association
- has_many :products
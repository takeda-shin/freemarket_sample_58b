# メルカリ クローン DB設計
## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null :false|
|family_name_kana|string|null :false|
|first_name|string|null :false|
|first_name_kana|string|null :false|
|email|string|null: false|
|password|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_date|integer|null: false|
|phone_number|string|unique:true|
|profile|string|

### Association
- has_many :products
- has_many :comments, :dependent => :destroy
- has_one :user_address
- has_one :card_info

## user_addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false|
|postal_code|integer|null :false|
|prefectures|integer|null :false|
|city|string|null :false|
|address|string|null :false|
|building|string|null :false|

### Association
- belongs_to :user

## card_infoテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false|
|card_number|integer|null: false|
|use_limit|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|category_id|string|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|price|integer|null: false|
|product_size|string|
|condition|string|null :false|
|shipping_charge|string|
|shipping_method|string|
|delivery_area|string|null :false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :photos, :dependent => :destroy
- has_many :comments, :dependent => :destroy

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|reference|null :false, foreign_key: true|
|name|string|

### Association
- belongs_to :product

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size_id|reference|null :false, foreign_key: true|

### Association
has_many :blands
has_many :products
has_one :category_size

## category_sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size_id|integer|null: false|
|size|string|


### blandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :products
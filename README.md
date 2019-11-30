# メルカリ　クローン DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
|address|string|null: false|
|profile|string|

### Association
- has_many :products
- has_many :comments

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|text|null: false|
|text|text|null: false|
|category|string|null :false|
|product_photo_id|string｜null :false｜
|brand_name|string|
|price|integer|null: false|
|product_size|string|
|condition|string|null :false|
|shipping_charge|string|
|shipping_method|string|
|delivery_area|string|null :false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many  :tags,  through:  :posts_tags

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :products
- has_many  :comments,  through:  :posts_tags

## product_categoryテーブル
|Column|Type|Options|
|------|----|-------|
||integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

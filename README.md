# フリマアプリ（メルカリ）クローンサイト
![freemarket](https://user-images.githubusercontent.com/55591073/80952807-37df1880-8e35-11ea-8832-5f7058d299de.png)

## 概要

TECH CAMP(旧 TECH::EXPERT)の最終課題において作成したアプリケーションです。<br>
チーム開発(4名)で開発したアプリケーションであるため、<br>
主に自身で実装した箇所および開発を通じて得られた知見について記載いたします。<br>
<br>
開発環境<br>
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code<br>
<br>
開発期間と平均作業時間<br>
開発期間：約3ヶ月間<br>
1日あたりの平均作業時間：約3時間<br>
<br>
開発体制<br>
人数：4名<br>
アジャイル型開発(スクラム)<br>
Trelloによるタスク管理<br>

## 接続先情報

http://18.177.64.29/<br>
ID: admin<br>
Pass: 1123<br>
<br>
テストアカウント<br>
購入者用<br>
mail: buyer_user@gmail.com <br>
pass: buyer_user<br>
<br>
購入用カード情報（ユーザー登録から試される場合）<br>
番号：4242424242424242（payjpテストカード）<br>
期限：翌月以降で入力ください<br>
セキュリティコード：1234<br>
<br>
出品者用<br>
メールアドレス: seller_user@gmail.com<br>
パスワード: seller_user<br

## 開発担当箇所
### ユーザー新規登録画面/ログイン(フロントエンド・バックエンド)
#### DEMO
![signup](https://user-images.githubusercontent.com/55591073/80953289-2fd3a880-8e36-11ea-9969-09b4e266754a.png)
http://18.177.64.29/signup/step1<br>
![login](https://user-images.githubusercontent.com/55591073/80953492-9ce73e00-8e36-11ea-87c3-ea598d8e952e.png)
http://18.177.64.29/users/sign_in<br>
#### 概要
情報を入力したユーザー情報はDBに保存される<br>
以後会員としてログインでき、サービスの提供を受けられる。<br>
#### 担当内容（バックエンド）
sessionを用いて複数ページにまたがった情報の入力を可能にする<br>
ユーザー情報を基本情報・商品の届け先・クレジットカード情報とそれぞれ異なるテーブルに保存する<br>
Twilioを導入し、SMS認証を可能にする<br>
（現在はTwilioのアカウント使用期限を超過しており、代わりに認証番号をalertで表示している）<br>
payjpを導入し、カード登録時にpayjp側へカード情報と顧客情報を新規作成する<br>
#### 担当内容（フロントエンド）
haml,scssを使用し、情報入力画面・ログイン画面のマークアップ作業<br>

### 商品購入機能（フロントエンド・バックエンド）





# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null :false|
|family_name_kana|string|null :false|
|first_name|string|null :false|
|first_name_kana|string|null :false|
|email|string|null: false|
|password|string|null: false|
|birthday|date|null: false|
|phone_number|string|unique:true|
|profile|string|

### Association
- has_many :products
- has_many ::sns_credentials, :dependent => :destroy
- has_many :comments, :dependent => :destroy
- has_one :user_address
- has_one :card_info

## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false|
|postal_code|integer|null :false|
|prefectures|integer|null :false|
|city|string|null :false|
|address|string|null :false|
|building|string|

### Association
- belongs_to :user, optional: true

## sns_credentials
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user_id|bigint|

### Association
- belongs_to :user

## card_infosテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false|
|card_number|bigint|
|security_code|integer|
|use_limit_month|integer|
|use_limit_year|integer|
|customer_id|string|null :false|
|card_id|string|null :false|

### Association
- belongs_to :user,optional: true

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
|estimated_delivery|string|
|image|string|
|status|integer|
|buyer_id|integer|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :photos, :dependent => :destroy
- has_many :comments, :dependent => :destroy

## photosテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|bigint|null :false, foreign_key: true|
|image_url|string|

### Association
- belongs_to :product,optional: true, :dependent => :destroy

## commentsテーブル(現在未実装)
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size_id|reference|null :false, foreign_key: true|

### Association
has_many :blands
has_many :products
has_one :category_size

## category_sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_id|integer|null: false|
|size|string|

### brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :products

## shipping_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_method|string|

## shipping_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_charge|string|

## delivery_areasテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_method|string|

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|
## 概要
- お気に入りのカフェのコミュニティーサイトです。

## 主な使用言語
<a><img src="https://github.com/rhyth09/fleamarket_sample_80e/blob/master/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="70px;" /></a> <!-- rubyのロゴ -->
<a><img src="https://github.com/rhyth09/fleamarket_sample_80e/blob/master/71774548-731b2900-2fb4-11ea-99ba-565546c5acb4.png" height="60px;" /></a> <!-- RubyOnRailsのロゴ -->
<a><img src="https://github.com/rhyth09/fleamarket_sample_80e/blob/master/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="60px;" /></a> <!-- Hamlのロゴ -->
<a><img src="https://github.com/rhyth09/fleamarket_sample_80e/blob/master/71774644-115bbe80-2fb6-11ea-822c-568eabde5228.png" height="60px" /></a> <!-- Scssのロゴ -->
<!-- <a><img src="https://github.com/rhyth09/fleamarket_sample_80e/blob/master/javascript_eyecatch.jpg" height="65px;" /></a> Javascriptのロゴ -->

## 機能紹介
- 新規会員登録・ログインをすると投稿ができます。
- 新規会員登録、ログインがお済みでない方もカフェの詳細を閲覧可能です。

# DB設計

## ER図
<img src="https://user-images.githubusercontent.com/67771587/91630191-613a3a80-ea0a-11ea-8b5a-2b0542f09c5d.png" />

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :shops
- has_many :comments, dependent: :destroy

## Shopsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|text|text|null:false|
|address|string|null:false|
|business_hours|integer|null:false|
|holiday|string||
|parking_id|integer|null:false|
### Association
- has_many :images, dependent: :destroy
- belongs_to User
- belongs_to_active_hash :parking

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|null:false, foreign_key:true|
### Association
- belongs_to :shop

## Comments_tableテーブル
|Column|Type|Options|
|------|----|-------|
|shop_id|references|null:false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|
|comment|text|null:false|
### Association
- belongs_to :user
- belongs_to :shop
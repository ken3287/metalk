
# Overview

このWEBアプリケーションは日記も書けるSNSを目指しています！

# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Asociation

- has_many :posts
- has_many :comments
- has_many :members
- has_many :groups, through: :members
- has_many :messages
- has_many :favorites
- has_many :tags
- has_many :dairys
- has_many :follows
- has_many :followers


## posts table

|Column|Type|Options|
|------|----|-------|
|body|text|null: false, index: true|

### Asociation

- has_many :comments
- has_many :post_images
- has_many :favorites
- has_many :tags
- belongs_to :user

## comments table

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|

### Asociation

- belongs_to :user
- belongs_to :post


## post_images table

|Column|Type|Options|
|------|----|-------|
|content|text||
|post_id|references|null: false, foreign_key: true|

### Asociation

- belongs_to :post

## favorites table

|Column|Type|Options|
|------|----|-------|
|favo|integer|null :false|
|tweet_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Asociation

- belongs_to :post
- belongs_to :user


## tags table

|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|post_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Asociation

- belongs_to :post
- belongs_to :user

## dairies table

|Column|Type|Options|
|------|----|-------|
|title|string|null :false|
|sentence|text|null :false|

### Asociation

-belongs_to :user


## dairy_images table

|Column|Type|Options|
|------|----|-------|
|content|text||
|dairy_id|references|null: false, foreign_key: true|

### Asociation

-belongs_to :dairy


## groups table

|Column|Type|Options|
|------|----|-------|
|name|string|null :false|

### Asociation

- has_many :messages
- has_many :members
- has_many :users, thriugh: :members

## messages table

|Column|Type|Options|
|------|----|-------|
|message|text||
|image|string||
|user_id|references|null :false, foreign_key :true|
|group_id|references|null :false, foreign_key :true|

### Asociation

- belongs_to :user
- belongs_to :group

## members table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key :true|
|group_id|references|null :false, foreign_key :true|

### Asociation

- belongs_to :user
- belongs_to :group

## follows table

|Column|Type|Options|
|------|----|-------|
|status|integer|null :false|
|user_id|references|null :false, foreign_key: true|

### Asociation

- belongs_to :user
- has_many :follower, through: :relations

## followers table

|Column|Type|Options|
|------|----|-------|
|status|integer|null :false|
|user_id|references|null :false, foreign_key: true|

### Asociation

- belongs_to :user
- has_many :follow, through: :relations

## relations table

|Column|Type|Options|
|------|----|-------|
|follow_id|references|null :false, foreign_key: true|
|follower_id|references|null :false, foreign_key: true|

-belongs_to :follower
-belongs_to :followe

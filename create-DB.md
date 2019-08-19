## DB設計

LucidChartを利用してER図を作成した
https://www.lucidchart.com/documents/edit/4ddb50ba-1632-40f2-b6ad-b2fe498151f3/0_0?shared=true

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
### Association
- has_one_attached :avatar
- has_one :forgettingcurve
- has_many :favorites
- has_many :wordbooks, through: :favorites
- has_many :wordbooks
- has_many :users-tags
- has_many :tags, through: :users-tags

## Wordbooksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|viewed|integer|null: false|
|reference|string||
|share|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :favorites
- has_many :users, through: :favorites
- has_one :test
- has_many :words
- has_many :wordbooks-tags
- has_many :tags, through: :wordbooks-tags

## Tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|entry|string|null: false|
### Association
- has_many :wordbooks-tags
- has_many :wordbooks, through: wordbooks-tags
- has_many :users-tags
- has_many :users, through: :users-tags

## Wordsテーブル
|Column|Type|Options|
|------|----|-------|
|front|string|null: false|
|reverse|string|null: false|
|wordbook_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :wordbook
- has_many :images
- has_one :question
## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|word_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :word

## Testsテーブル
|Column|Type|Options|
|------|----|-------|
|times|integer|null: false|
|wordbook_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :wordbook
- has_many :testresults
- has_many :questions

## Questionsテーブル
|Column|Type|Options|
|------|----|-------|
|test_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :test
- belongs_to :word
- has_many : testwords

## Testwordsテーブル
|Column|Type|Options|
|------|----|-------|
|word|string|null: false|
|correct|integer|null: false|
|question_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :question
- has_many :selections

## Testresultsテーブル
|Column|Type|Options|
|------|----|-------|
|score|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|test_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :test
- belongs_to :user
- has_many :selections

## Forgettingcurvesテーブル
|Column|Type|Options|
|------|----|-------|
|tenminutes|integer|null: false|
|onehoure|integer|null: false|
|oneday|integer|null: false|
|type|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## Avatarsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## Selectionsテーブル
|Column|Type|Options|
|------|----|-------|
|testword_id|integer|null: false, foreign_key: true|
|testresult_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :testword
- belongs_to :testresult


# 中間テーブル

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|wordbook_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :wordbook

## Users-Tagsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tags_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tag

## Wordbooks-Tagsテーブル
|Column|Type|Options|
|------|----|-------|
|wordbook_id|integer|null: false, foreign_key: true|
|tags_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :wordbook
- belongs_to :tag


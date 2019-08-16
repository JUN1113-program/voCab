class Wordbook < ApplicationRecord
  has_many :users_wordbooks
  has_many :users, through: :users_wordbooks
  has_many :favorites
  has_many :users, through: :favorites
  has_many :tests
  has_many :words
  has_many :wordbooks_tags
  has_many :tags, through: :wordbooks_tags
end

class Wordbook < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :tests
  has_many :words
  has_many :wordbook_tags
  has_many :tags, through: :wordbook_tags
end

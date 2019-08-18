class Wordbook < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :tests, dependent: :destroy
  has_many :words, dependent: :destroy
  has_many :wordbook_tags, dependent: :destroy
  has_many :tags, through: :wordbook_tags
end

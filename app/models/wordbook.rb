class Wordbook < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_one :test, dependent: :destroy
  has_many :words, dependent: :destroy
  has_many :wordbook_tags, dependent: :destroy
  has_many :tags, through: :wordbook_tags

  validates :title, presence: true
  validates :share, presence: true
end

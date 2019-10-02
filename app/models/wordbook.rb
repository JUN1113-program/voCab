class Wordbook < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_one :test, dependent: :destroy
  has_many :words, dependent: :destroy
  has_many :wordbook_tags, dependent: :destroy
  has_many :tags, through: :wordbook_tags, dependent: :destroy

  validates :title, presence: true
end

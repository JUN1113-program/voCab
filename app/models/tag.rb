class Tag < ApplicationRecord
  has_many :wordbook_tags, dependent: :destroy
  has_many :wordbooks, through: :wordbook_tags
  has_many :user_tags
  has_many :users, through: :user_tags
end
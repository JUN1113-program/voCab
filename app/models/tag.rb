class Tag < ApplicationRecord
  has_many :wordbooks_tags
  has_many :wordbooks, through: :wordbooks_tags
  has_many :users_tags
  has_many :users, through: :users_tags
end
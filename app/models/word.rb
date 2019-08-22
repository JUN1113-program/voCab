class Word < ApplicationRecord
  belongs_to :wordbook
  has_one :question
  has_many :images
  validates :front, presence: true
  validates :reverse, presence: true
end
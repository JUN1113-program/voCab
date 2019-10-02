class Word < ApplicationRecord
  belongs_to :wordbook
  has_one :question, dependent: :destroy
  has_many :images, dependent: :destroy
  validates :front, presence: true
  validates :reverse, presence: true
end
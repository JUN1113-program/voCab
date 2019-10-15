class Word < ApplicationRecord
  belongs_to :wordbook
  has_one :question, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :front, presence: true, length: { maximum: 30 }
  validates :reverse, presence: true, length: { maximum: 30 }
end
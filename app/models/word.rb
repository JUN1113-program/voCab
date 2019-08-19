class Word < ApplicationRecord
  belongs_to :wordbook
  has_one :question
  has_many :images
end
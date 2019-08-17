class Word < ApplicationRecord
  belongs_to :wordbook
  has_many :images
end
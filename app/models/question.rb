class Question < ApplicationRecord
  belongs_to :test
  belongs_to :word
  has_many :testwords
end

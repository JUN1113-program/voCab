class Test < ApplicationRecord
  belongs_to :wordbook
  has_many :testresults, dependent: :destroy
  has_many :questions, dependent: :destroy

  attr_accessor :word
end
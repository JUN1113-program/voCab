class Test < ApplicationRecord
  belongs_to :wordbook
  has_many :testresults
  has_many :questions
end

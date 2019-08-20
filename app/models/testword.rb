class Testword < ApplicationRecord
  belongs_to :question
  has_many :selections
  has_many :testresults, through: :selections
end

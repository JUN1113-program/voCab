class Testword < ApplicationRecord
  belongs_to :question
  has_many :selections, dependent: :destroy
  has_many :testresults, through: :selections, dependent: :destroy
end

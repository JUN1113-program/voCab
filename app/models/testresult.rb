class Testresult < ApplicationRecord
  belongs_to :test
  belongs_to :user
  has_many :selections
  has_many :testwords, through: :selections
end

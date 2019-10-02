class Testresult < ApplicationRecord
  belongs_to :test
  belongs_to :user
  has_many :selections, dependent: :destroy
  has_many :testwords, through: :selections, dependent: :destroy
end

class Testresult < ApplicationRecord
  belongs_to :test
  belongs_to :user
  has_many :selections, dependent: :destroy
  has_many :testwords, through: :selections, dependent: :destroy

  validates :score, presence: true, numericality:{only_interger: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
end

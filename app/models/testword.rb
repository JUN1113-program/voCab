class Testword < ApplicationRecord
  belongs_to :question
  has_many :selections, dependent: :destroy
  has_many :testresults, through: :selections, dependent: :destroy

  validates :word, presence: true, length: { maximum: 30 }
  validates :correct, presence: true, inclusion: { in: [0, 1] }
end

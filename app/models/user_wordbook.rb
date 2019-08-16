class UserWordbook < ApplicationRecord
  belongs_to :user
  belongs_to :wordbook
end

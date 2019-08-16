class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one_attached :avatar
  has_one_attached :forgettingcurve
  has_many :favorites
  has_many :wordbooks, through: :favorites
  has_many :users_wordbooks
  has_many :wordbooks, through: :users_wordbooks
  has_many :users_tags
  has_many :tags, through: :users_tags
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one_attached :avatar
  has_one_attached :forgettingcurve
  has_many :favorites
  has_many :wordbooks, through: :favorites
  has_many :wordbooks
  has_many :user_tags
  has_many :tags, through: :user_tags
end

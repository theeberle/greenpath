class Category < ApplicationRecord
  has_many :challenges
  has_many :habits, through: :challenges
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  has_one_attached :picture
end

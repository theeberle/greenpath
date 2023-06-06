class Category < ApplicationRecord
  has_many :challenges
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
end

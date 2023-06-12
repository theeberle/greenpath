class Challenge < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :saving_carbonamount, presence: true
  validates :description, presence: true
  has_one_attached :picture
  # added to test the challenge completed
  has_many :habits, dependent: :destroy
  has_many :events, through: :habits
end

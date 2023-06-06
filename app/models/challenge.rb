class Challenge < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :saving_carbonamount, presence: true
  validates :description, presence: true
end

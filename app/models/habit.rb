class Habit < ApplicationRecord
  DAYS_OF_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  IMPLEMENTATION_CYCLE = %w[Daily Weekly Monthly One-off]

  belongs_to :challenge
  belongs_to :user
  has_many :events, dependent: :destroy
  validates :implementation_cycle, presence: true
  validates :day_of_week, inclusion: { in: DAYS_OF_WEEK }
  validates :implementation_cycle, inclusion: { in: IMPLEMENTATION_CYCLE }
end

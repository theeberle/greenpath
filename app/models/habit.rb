class Habit < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
  has_many :events
  validates :implementation_cycle, presence: true
end

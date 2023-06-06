class Event < ApplicationRecord
  belongs_to :habit
  validates :status, presence: true
  validates :due_date, presence: true
end

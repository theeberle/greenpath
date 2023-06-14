class Event < ApplicationRecord
# added the status  global variables
# event has a status enum status: { upcoming: 0, overdue: 1, accomplished: 2 }



  belongs_to :habit

  # added the status inclusion

  validates :status, presence: true
  validates :due_date, presence: true, uniqueness: { scope: :habit }


  has_one :challenge, through: :habit  # Add this association for the access to the event


  # new def for testing event
  def challenge_name
    habit.challenge.name
  end

  def generate_recurring_events(event, end_date)
    schedule = IceCube::Schedule.new(event.due_date.to_date)
    case event.habit.implementation_cycle.downcase
    when "daily"
      schedule.add_recurrence_rule IceCube::Rule.daily
    when "weekly"
      schedule.add_recurrence_rule IceCube::Rule.weekly(1).day(event.habit.day_of_week.downcase.to_sym)
    when "monthly"
      schedule.add_recurrence_rule IceCube::Rule.monthly(1).day(event.habit.day_of_week.downcase.to_sym)
    end

    schedule.occurrences(end_date.to_date).each do |date|
      next if date <= Date.current
      recurring_event = event.dup
      recurring_event.due_date = date
    # recurring_event.name = event.habit.challenge.name if event.habit.present? # Set the name only if the habit is present
      recurring_event.save
    end
  end


end

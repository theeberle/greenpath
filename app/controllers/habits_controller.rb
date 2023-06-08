class HabitsController < ApplicationController
  before_action :set_challenge, only: %i[new create]

  def index
    @habits = Habit.all
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    @habit.challenge = Challenge.find(params[:challenge_id])
    if @habit.save
      event = Event.new(habit: @habit, status: "upcoming", due_date: calculate_due_date(@habit))
      event.generate_recurring_events(event, Date.today.next_month.next_month)
      redirect_to challenge_path(@habit.challenge)
    else
      render "challenges/show"
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def habit_params
    params.require(:habit).permit(:day_of_week, :implementation_cycle)
  end

  def calculate_due_date(habit)
    if habit.implementation_cycle.downcase == "daily"
      Date.tomorrow
    else
      Date.today.next_week(habit.day_of_week.downcase.to_sym)
    end
  end

end

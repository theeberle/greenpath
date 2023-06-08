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
      redirect_to dashboard_path
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

end

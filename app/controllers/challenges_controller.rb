class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
    @categories = Category.all
    @category = params[:category]

    # filter with category
    if @category.present?
      @challenges = @challenges.where(category: params[:category])
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @habit = Habit.new
  end
end

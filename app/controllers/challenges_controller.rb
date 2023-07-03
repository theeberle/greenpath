class ChallengesController < ApplicationController
  #  Skip authentication for index and show actions
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @challenges = Challenge.all
    @categories = Category.all
    @category = params[:category]
    @description = "general description"

    #  Filter challenges by category if category is present
    if @category.present?
      @challenges = @challenges.where(category: params[:category])
      @category_name = Category.find(@category).name
      @category_description = Category.find(@category).description
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @habit = Habit.new
  end
end

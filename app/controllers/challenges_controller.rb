class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @challenges = Challenge.all
    @categories = Category.all
    @category = params[:category]
    @description = "general description"

    # filter with category
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

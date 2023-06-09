class DashboardsController < ApplicationController
  def index
    @user = current_user
    @habits = current_user.habits
    @user_challenges = @user.challenges
  end
end

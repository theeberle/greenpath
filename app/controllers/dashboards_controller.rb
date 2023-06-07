class DashboardsController < ApplicationController
  def show
    @habits = current_user.habits
  end
end

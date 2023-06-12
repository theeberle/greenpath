class DashboardsController < ApplicationController
  def index
    @user = current_user
    @habits = current_user.habits

    # change this to current_user.habits
    @user_challenges = @user.habits
    # set_pie_chart_data
  end

  private

  # def set_pie_chart_data
  #   @grouped_data = @habits.group(:category_id).count
  #   @pie_data = []

  #   @grouped_data.map do |category_id, count|
  #     @pie_data << [Category.find(category_id).name, count]
  #   end
  # end

  # def set_carbon_chart_data
  #   @carbon_data = []
  # end

  # def set_event_chart_data
  #   @event_data = []
  # end
end

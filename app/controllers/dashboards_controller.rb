class DashboardsController < ApplicationController
  def index
    @user = current_user
    # @habits = current_user.habits

    @user_challenges = @user.habits

    @events = current_user.events.where(due_date: Date.today.next_week..(Date.today.next_week + 6))


    @user_events_completed = Event.joins(habit: :user).where(users: { id: @user.id }, status: "completed")
    # @user_carbon_completed = Event.joins(habit: :user).where(users: { id: @user.id }, status: "completed")

    set_pie_chart_data
    # set_carbon_chart_data
    set_event_chart_data
  end

  private

  # def set_carbon_chart_data
  #   @sum_carbon_day = @user_carbon_completed.group(:day_of_week).count # Adds up data of all Mondays, not current?
  #   @carbon_data = []

  #   @sum_challenges_day.map do |day_of_week, count|
  #     @carbob_data << [day_of_week, count]
  #   end
  # end

  def set_event_chart_data
    @sum_challenges_day = @user_events_completed.group(:day_of_week).count # Adds up data of all Mondays, not current?
    @event_data = []

    @sum_challenges_day.map do |day_of_week, count|
      @event_data << [day_of_week, count]
    end
  end

  def set_pie_chart_data
    @grouped_data = @user.challenges.group(:category_id).count
    @pie_data = []

    @grouped_data.map do |category_id, count|
      @pie_data << [Category.find(category_id).name, count]
    end
  end
end

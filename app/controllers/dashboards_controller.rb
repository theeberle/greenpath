class DashboardsController < ApplicationController
  include ApplicationHelper

  def index
    @user = current_user
    @user_challenges = @user.habits
    @score = carbon_badge(@user.carbon_count)
    date_range = Date.today..(Date.today + 6)
    @events = current_user.events.where(due_date: date_range)
    @past_events = current_user.events.where(due_date: Date.today.last_week..Date.today, status: "accomplished")
    @user_events_completed = Event.joins(habit: :user).where(users: { id: @user.id }, status: "accomplished")
    # @user_carbon_completed = Event.joins(habit: :user).where(users: { id: @user.id }, status: "accomplished")

    @weekdays = Date::DAYNAMES.rotate(Date.today.wday)

    set_pie_chart_data
    set_carbon_chart_data
    set_event_chart_data
  end

  private

  def set_carbon_chart_data
    @sorted_carbon = @past_events.sort_by{ |event| event.due_date }
    @display = {
    }

    @sorted_carbon.each do |event|
      date = event.due_date.strftime("%a")
      if @display[date].nil?
        @display[date] = event.challenge.saving_carbonamount
      else
        @display[date] += event.challenge.saving_carbonamount
      end
    end
  end

  def set_event_chart_data
    @sorted_events = @past_events.sort_by{ |event| event.due_date }
    @event_data = {
    }

    @sorted_events.each do |event|
      date = event.due_date.strftime("%a")
      if @event_data[date].nil?
        @event_data[date] = 1
      else
        @event_data[date] += 1
      end
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

class DashboardsController < ApplicationController
  def index
    @user = current_user

    @user_challenges = @user.habits

    @events = current_user.events.where(due_date: Date.today.next_week..(Date.today.next_week + 6))

    @past_events = current_user.events.where(due_date: Date.today.last_week..Date.today, status: "accomplished")

    set_pie_chart_data
    set_carbon_chart_data
    set_event_chart_data
  end

  private

  def set_carbon_chart_data
    @display = {
    }

    @past_events.each do |event|
      date = event.due_date.strftime("%a")
      if @display[date].nil?
        @display[date] = event.challenge.saving_carbonamount
      else
        @display[date] += event.challenge.saving_carbonamount
      end
    end
  end

  def set_event_chart_data
    @sum_challenges_day = @past_events.group(:due_date).count
    @event_data = []

    @sum_challenges_day.map do |due_date, count|
      @event_data << [due_date.strftime("%a"), count]
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

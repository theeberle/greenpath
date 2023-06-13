class DashboardsController < ApplicationController
  def index
    @user = current_user

    @user_challenges = @user.habits

    @events = current_user.events.where(due_date: Date.today..Date.today.next_week)

    @past_events = current_user.events.where(due_date: Date.today.last_week..Date.today, status: "accomplished")

    # add the 3 different animations depending on the user's points level
    if current_user.carbon_count == 0
      @tree = "https://assets4.lottiefiles.com/packages/lf20_o32VvNhBlv.json"
    elsif current_user.carbon_count < 100
      @tree = "https://assets4.lottiefiles.com/packages/lf20_e3ux72wx.json"
    elsif current_user.carbon_count > 100 && current_user.carbon_count < 500
      @tree = "https://assets4.lottiefiles.com/private_files/lf30_I6qCjk.json"
    else
      @tree = "https://assets8.lottiefiles.com/private_files/lf30_jdygihq2.json"
    end
    # tree logic end

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

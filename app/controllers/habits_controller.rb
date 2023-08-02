# test: added logic for saving the carbon amount assigned to the cycle selected by user
class HabitsController < ApplicationController
  before_action :set_challenge, only: %i[new create update destroy]

  def index
   # @habits = Habit.all
    @habits = current_user.habits.includes(:events)
    @habit = @habits.first
    @weekly_events = generate_weekly_events_hash(@habits)
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    @habit.challenge = Challenge.find(params[:challenge_id])
    if @habit.save
      event = Event.new(habit: @habit, status: "upcoming", due_date: calculate_due_date(@habit))
      event.save
      event.generate_recurring_events(event, Date.today.next_month.next_month)

      redirect_to dashboard_path
    else
      render "challenges/show"
    end
  end

  def update
    @habit = Habit.find(params[:id])
    if @habit.update(habit_params)
      # update_carbon_amount
      redirect_to dashboard_path, notice: "Habit was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.update(active: false)
    @habit.events.each { |event| event.destroy if event.due_date > Date.tomorrow }

    if @habit.save
      redirect_to dashboard_path, notice: "Habit and upcoming events were successfully deleted."
    else
      redirect_to dashboard_path, alert: "Failed to delete habit and upcoming events."
    end
  end

# link the event completion with the carbon score

  def event_completed

    event = Event.find(params[:event_id])

    if event.update(status: "accomplished")
      update_user_carbon_score(event.habit)
      redirect_to dashboard_path, notice: "Event completed successfully."
    else
      redirect_to dashboard_path, alert: "Failed to complete the event."
    end
  end

  def event_deleted
    event = Event.find(params[:event_id])

    if event.destroy
      unless event.status == "deleted"
        update_user_carbon_score(event.habit)
      end
      redirect_to dashboard_path, notice: "Event deleted successfully."
    else
      redirect_to dashboard_path, alert: "Failed to delete the event."
    end
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def generate_weekly_events_hash(habits)
    weekly_events = {}

    (0..6).each do |day_offset|
      current_day = Date.today + day_offset
      events = []

      habits.each do |habit|
        events += habit.events.select { |event| event.due_date.to_date == current_day }
      end

      weekly_events[current_day.strftime("%A").downcase.to_sym] = events
    end

    weekly_events
  end

  def habit_params
    params.require(:habit).permit(:day_of_week, :implementation_cycle)
  end

  def calculate_due_date(habit)
    if habit.implementation_cycle.downcase == "daily"
      Date.today
    else
      Date.today.next_week(habit.day_of_week.downcase.to_sym) - 7
    end
  end

  # for the total score of the user
  def update_user_carbon_score(habit)
    carbon_amount = habit.challenge.saving_carbonamount
    user = habit.user
    user.update(carbon_count: user.carbon_count + carbon_amount)
  end

  # might not be needed

  # def update_carbon_amount
  #   case @habit.implementation_cycle.downcase
  #   when "daily"
  #     @challenge.update(saving_carbonamount: @challenge.saving_carbonamount.to_i * 365)
  #   when "weekly"
  #     @challenge.update(saving_carbonamount: @challenge.saving_carbonamount.to_i * 52)
  #   when "monthly"
  #     @challenge.update(saving_carbonamount: @challenge.saving_carbonamount.to_i * 12)
  #   end
  # end


end







# old version friday

# class HabitsController < ApplicationController
#   before_action :set_challenge, only: %i[new create]

#   def index
#     @habits = Habit.all
#   end

#   def create
#     @habit = Habit.new(habit_params)
#     @habit.user = current_user
#     @habit.challenge = Challenge.find(params[:challenge_id])
#     if @habit.save
#       event = Event.new(habit: @habit, status: "upcoming", due_date: calculate_due_date(@habit))
#       event.generate_recurring_events(event, Date.today.next_month.next_month)
#       redirect_to dashboard_path
#     else
#       render "challenges/show"
#     end
#   end

#   def update
#     @habit = Habit.find(params[:id])
#     if @habit.update(habit_params)
#       # Update the existing recurring events based on the updated habit details
#       @habit.events.each { |event| event.destroy if event.due_date > Date.tomorrow }
#       event = Event.new(habit: @habit, status: "upcoming", due_date: calculate_due_date(@habit))
#       event.generate_recurring_events(event, Date.today.next_month.next_month)

#       redirect_to dashboard_path, notice: "Habit was successfully updated."
#     else
#       render :edit
#     end
#   end

#   def destroy
#     @habit = Habit.find(params[:id])
#     @habit.update(active: false)
#     @habit.events.each {|event| event.destroy if event.due_date > Date.tomorrow }  # Delete all associated events in the future

#     if @habit.save
#       redirect_to dashboard_path, notice: "Habit and upcoming events were successfully deleted."
#     else
#       redirect_to dashboard_path, alert: "Failed to delete habit and upcoming events."
#     end
#   end

#   private

#   def set_challenge
#     @challenge = Challenge.find(params[:challenge_id])
#   end

#   def habit_params
#     params.require(:habit).permit(:day_of_week, :implementation_cycle)
#   end

#   def calculate_due_date(habit)
#     if habit.implementation_cycle.downcase == "daily"
#       Date.tomorrow
#     else
#       Date.today.next_week(habit.day_of_week.downcase.to_sym)
#     end
#   end

# end

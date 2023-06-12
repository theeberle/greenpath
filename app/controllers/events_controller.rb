class EventsController < ApplicationController

   # update the status of the event (upcoming, overdue)- doesn't work
   
    # def event_completed
    #   event = Event.find(params[:id])
    #   event.update(status: "accomplished")
    #   update_user_carbon_score(event.habit)
    # end

    # private

    # def update_user_carbon_score(habit)
    #   carbon_amount = habit.challenge.saving_carbonamount
    #   user = habit.user
    #   user.update(total_carbon_score: user.total_carbon_score + carbon_count)
    # end


end

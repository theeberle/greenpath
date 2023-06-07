class ChallengesController < ApplicationController

 # to show all the challenges in the index page & show page
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end

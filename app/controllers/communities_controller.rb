class CommunitiesController < ApplicationController
  def index
    @users = User.order(carbon_count: :desc)
  end
end

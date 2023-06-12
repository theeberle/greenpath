class CommunitiesController < ApplicationController
  def index
    @users = User.order(carbon_count: :desc)
    @current_user_rank = @users.index(current_user) if current_user.present?
  end
end

class SearchController < ApplicationController
  def index
    sql_query = <<~SQL
      name @@ :query
      OR description @@ :query

    SQL
    @categories = Category.where(sql_query, query: "%#{params[:query]}%")

    sql_query = <<~SQL
      challenges.name @@ :query
      OR challenges.description @@ :query
      OR categories.name @@ :query

    SQL
    @challenges = Challenge.joins(:category).where(sql_query, query: "%#{params[:query]}%")

    sql_query = <<~SQL
    users.username @@ :query
    OR users.profile_description @@ :query
    OR users.email @@ :query
    OR users.city @@ :query

    SQL
    @users = User.where(sql_query, query: "%#{params[:query]}%")
  end
end

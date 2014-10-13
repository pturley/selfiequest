class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:login]

  def login
    user = User.find(params[:id])

    cookies[:user] = params[:id] if user && user.correct_id?(params[:id])

    redirect_to quests_path
  end
end

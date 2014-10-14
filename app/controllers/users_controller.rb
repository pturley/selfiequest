class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:login]

  def login
    user = User.find(params[:id])

    cookies[:user] = params[:id] if user && user.correct_id?(params[:id])

    quest_id_to_redirect_to = params[:quest_id] ? params[:quest_id] : user.quests.first.id
    redirect_to quest_path(quest_id_to_redirect_to)
  end
end

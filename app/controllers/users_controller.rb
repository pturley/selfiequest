class UsersController < ApplicationController

  def login
    cookies[:user] = params[:id]

    User.find(cookies[:user])

    redirect_to quest_path

  end
end

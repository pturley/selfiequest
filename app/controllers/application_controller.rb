class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def authenticate_user!
    user = User.find(cookies[:user]) if cookies[:user]
    @current_user = user if user && user.correct_id?(cookies[:user])
    render :status => :forbidden, :text => "You must login before accessing this page" unless @current_user
  end
end

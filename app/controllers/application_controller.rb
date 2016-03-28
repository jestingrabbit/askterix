class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user

  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_logged_in
    unless @current_user
      flash[:error] = "ಠ_ಠ You need to be logged in to do that ಠ_ಠ"
      redirect_to root_path
    end
  end
end

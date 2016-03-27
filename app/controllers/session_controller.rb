class SessionController < ApplicationController
  def new
  end

  def create
    identifier = params[:identifier]
    user_name = User.find_by :name => identifier
    user_email = User.find_by :email => identifier
    if user_name.present? && user_name.authenticate(params[:password])
      session[:user_id] = user_name.id
      redirect_to root_path
    elsif user_email.present? && user_email.authenticate(params[:password])
      session[:user_id] = user_email.id
      redirect_to root_path
    else
      flash[:error] = "Invalid login"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

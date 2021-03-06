class SessionController < ApplicationController
  def new
  end

  def create
    identifier = params[:identifier]
    user = User.find_by(:name => identifier) || User.find_by(:email => identifier)
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
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

class UsersController < ApplicationController

  before_filter :login_check, :except => [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    @user.points = 1
    @user.hide_state = 0
    @user.admin = 0
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update user_params
      redirect_to @current_user
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :avatar,
      :link,
      :bio,
      :password,
      :password_confirmation
    )
  end

  def login_check
    unless @current_user
      flash[:error] = "You can't view that unless you're logged in"
      redirect_to root_path
    end
  end
end

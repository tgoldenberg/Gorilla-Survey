class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "That username has already been used"
      redirect_to new_user_path
    end
  end

  def edit
  end

  def show
    @user = User.find(session[:user_id])
  end

  def destroy
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

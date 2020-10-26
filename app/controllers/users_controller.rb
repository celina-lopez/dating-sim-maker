class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def create
    @user = User.find_or_initialize_by(username: new_user_params.fetch(:username), password: new_user_params.fetch(:password))

    if @user.save
      render "sessions/new"
    else 
      render :new
    end
  end

  def new
    @user = User.new
  end

  private
    def new_user_params
      params.require(:user).permit(:password, :username)
    end

    def user_params
      params.require(:user).permit(
        :password,
        :username,
      )
    end

end

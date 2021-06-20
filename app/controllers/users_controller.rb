class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def edit
    @user = current_user
  end

  def create
    @user = User.find_or_initialize_by(
      username: new_user_params.fetch(:username)
    )

    @user.update_attributes(password: user_params[:password])

    if @user.save
      render "sessions/new"
    else 
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

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

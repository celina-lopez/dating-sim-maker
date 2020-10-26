class SessionsController < ApplicationController
  respond_to :html

  def new
    @user = User.new
  end

  def create
    password = params[:user][:password]
    @user = User.find_by_username(params[:user][:username])

    if @user.nil?
      #TODO: put all alerts in yml
      flash[:alert] = "Havent made an account!"
      redirect_to new_session_url
      return
    end
    if @user.password == password
      session[:user_id] = @user.id

      redirect_to stories_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Nope! Password bad?"
      render :new
    end
  end

  def destroy
  end

end

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.authenticate(user_params)
      @user = User.find_by_username(params[:username])
      session[:id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end
end

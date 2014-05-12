class SessionsController < ApplicationController
  def new
  end

  def create
    if User.authenticate(user_params)
      @user = User.find_by_username(params[:username])
      session[:id] = @user.id
      puts "logged in******************************************************************************"
      redirect_to root_path
    else
      puts "******************************************************************************"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(params[:username], params[:password])
  end
end

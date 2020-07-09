class SessionsController < ApplicationController
  def new
      @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    
    return head(:forbidden) unless user_params[:password] == @user.password
    session[:user_id] = @user.id
    redirect_to home_path(session[:user_id])
  end
  private
  def user_params
    params.require(:user).permit(:username,:password)
  end  
end
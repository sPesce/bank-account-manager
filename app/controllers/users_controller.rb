class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    if (@user.save) && (@user.valid?)
      session[:id] = @user.id
      redirect_to home_path(@user.id)
    else
      render :new
    end

    # new_user = User.new(user_params)
    # new_user.save
    # if (new_user.save) && (new_user.valid?)
    #   session[:id] = new_user.id
    #   redirect_to home_path(new_user.id)
    # else
    #   render :new
    # end
  end

  def homepage
    @user = User.find(session[:id])  
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:username)
  end
end

class OnlineBankingAccountsController < ApplicationController
  
  def new    
    @online_banking_account = OnlineBankingAccount.new
  end
  def create
    new_account = OnlineBankingAccount.new(user_id: session[:id],bank_id: oba_params[:bank_id],username: oba_params[:username])
    if new_account.save
      redirect_to home_path(session[:id])
    else
      render :new
    end
  end
  # def destroy
    
  # end
  private
  def oba_params
    params.require(:online_banking_account).permit(:bank_id,:username)
  end
end

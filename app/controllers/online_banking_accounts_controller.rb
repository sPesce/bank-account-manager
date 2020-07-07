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
  def show
    @online_banking_account = OnlineBankingAccount.find(params[:id])
    @checking = @online_banking_account.deposit_accounts.find_by(category: "checking")
    @savings = @online_banking_account.deposit_accounts.find_by(category: "savings")
    @loans = @online_banking_account.loans
  end
  def open_checking_account
  end
  def open_savings_account
  end

  # def destroy

  # end
  private
  def oba_params
    params.require(:online_banking_account).permit(:bank_id,:username)
  end

end

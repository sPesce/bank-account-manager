class OnlineBankingAccountsController < ApplicationController
  
  TODO: FIX PARAMS SWITCHING
      : REMOVE DEBUG(PARAMS) FROM LAYOUT
  before_action :set_oba, only: [:show,:new_checking_account,:new_savings_account]
  def new    
    @oba = OnlineBankingAccount.new
  end
  def create#refactor oba creation
    new_account = OnlineBankingAccount.new(user_id: session[:id],bank_id: oba_params[:bank_id],username: oba_params[:username])
    if new_account.save
      redirect_to home_path(session[:id])
    else
      render :new
    end
  end
  def show
    #load each sub-account for current OnlineBankingAccount
    @checking = @oba.deposit_accounts.find_by(category: "checking")
    @savings = @oba.deposit_accounts.find_by(category: "savings")
    @loans = @oba.loans
  end
  #create savings account for this online banking acount
  def open_savings_account    
    DepositAccount.create(deposit_account_params)     
    redirect_to user_online_banking_account_path(session[:id],params[:id])  
  end
  def new_checking_account    
  end
  def new_savings_account        
  end
  # def destroy

  # end
  private
  #params for online banking account object
  def oba_params
    params.require(:online_banking_account).permit(:bank_id,:username)
  end
  #params for deposit account object
  def deposit_account_params
    params.require(:deposit_account).permit(:online_banking_account_id, :category, :balance)
  end

  #set online banking account
  #debugged_params temporary fix to params[:id] switching between oba id and user id
  def set_oba    
    params[:user_id] ? debugged_params = params[:id] : debugged_params = params[:bank_account_id]
    @oba = OnlineBankingAccount.find(debugged_params)
  end


end

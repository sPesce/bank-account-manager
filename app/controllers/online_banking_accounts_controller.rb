class OnlineBankingAccountsController < ApplicationController
  

  before_action :set_oba, only: [:show,:new_checking_account,:new_savings_account,:new_loan,:create_loan]
  def new    
    @oba = OnlineBankingAccount.new
  end
  def create#refactor oba creation
    
    @oba = OnlineBankingAccount.new(user_id: session[:id],bank_id: oba_params[:bank_id],username: oba_params[:username])
    if @oba.save && @oba.valid?
      redirect_to home_path(session[:id])
    else
      render :new
    end
    # new_account = OnlineBankingAccount.new(user_id: session[:id],bank_id: oba_params[:bank_id],username: oba_params[:username])
    # if new_account.save
    #   redirect_to home_path(session[:id])
    # else
    #   render :new
    # end
  end
  def show
    #load each sub-account for current OnlineBankingAccount
    @checking = @oba.deposit_accounts.find_by(category: "checking")
    @savings = @oba.deposit_accounts.find_by(category: "savings")
    @loans = @oba.loans
  end
  #create savings account for this online banking acount
  def open_savings_account  
    open_deposit_account(deposit_account_params)
  end
  def open_checking_account
    open_deposit_account(deposit_account_params)
  end
  def new_checking_account        
  end
  def new_savings_account
  end
  def new_loan
    @loan = Loan.new
  end
  def create_loan
    @oba.loans.build(loan_params).save
    redirect_to user_online_banking_account_path(session[:id],params[:online_banking_account_id])
  end
  private
  #params for online banking account object
  def oba_params
    params.require(:online_banking_account).permit(:bank_id,:username)
  end
  #params for deposit account object
  def deposit_account_params
    params.require(:deposit_account).permit(:online_banking_account_id, :category, :balance)
  end
  #params for loan object
  def loan_params
    params.require(:loan).permit(:category,:amount,:maturity_months)
  end

  #set online banking account
  #debugged_params temporary fix to params[:id] switching between oba id and user id
  def set_oba
    if params[:online_banking_account_id]
      @oba = OnlineBankingAccount.find(params[:online_banking_account_id])
    else
      @oba = OnlineBankingAccount.find(params[:id])
    end
  end
  def open_deposit_account(parameters)
    DepositAccount.create(parameters)     
    redirect_to user_online_banking_account_path(session[:id],params[:online_banking_account_id])
  end
end

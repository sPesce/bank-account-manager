class LoansController < ApplicationController
  def new_loan_payment
    @loan = Loan.find(params[:loan_id])
    @checking = @loan.online_banking_account.checking
  end
  def create_loan_payment
    loan = Loan.find(params[:loan_id])
    users_checking = User.find(session[:user_id]).checking_account
    payment = loan_params[:payment_amount].to_d       
    if payment <= users_checking.balance
      loan.balance += payment
      users_checking.balance -= payment
      flash[:message] = "Paid #{payment} from checking to loan account"      
      redirect_to user_online_banking_account_path(session[:id],loan.online_banking_account.id)
    else
      flash[:error] = "You do not have enough money in your checking account to make this transaction"
      redirect_to :new_loan_payment
    end
    if loan.balance >= 0.0        
      users_checking.balance += loan.balance
      loan.balance = 0.0
      loan.closed_date = DateTime.now
    end
    #save each account
    [loan,users_checking].each{|o|o.save}  
  end
  private
  def loan_params
    params.require(:loan).permit(:payment_amount)
  end

end

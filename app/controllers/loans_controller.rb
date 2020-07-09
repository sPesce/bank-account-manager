class LoansController < ApplicationController
  def new_loan_payment
    @loan = params[:loan_id]
  end
  def create_loan_payment
    loan = Loan.find(params[:loan_id])
    users_checking = User.find(session[:user_id]).checking_account
    payment = loan_params[:payment_amount].to_d       
    if payment <= users_checking.balance
      loan.balance += payment
      users_checking.balance -= payment
    else
      #
    end
    if loan.balance >= 0.0        
      users_checking.balance += loan.balance
      loan.balance = 0.0
      loan.closed_date = DateTime.now
    end
    [loan,users_checking].each{|o|o.save}  
  end
  private
  def loan_params
    params.require(:loan).permit(:payment_amount)
  end

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Bank.destroy_all
OnlineBankingAccount.destroy_all
DepositAccount.destroy_all
Loan.destroy_all 

bank_name = ['TD Bank', 'Chase Bank', 'PNC Bank' ]
bank_address = ['https://www.td.com/', 'https://www.chase.com/', 'https://www.pnc.com/']

[0,1,2].each do |i|
    Bank.create(name: bank_name[i], web_address: bank_address[i])
end
   
    
User.create(first_name: "Steve", username: "SP101", password: "mememe")

ac = OnlineBankingAccount.new(username: 'Issa', password: 'abcdef')
ac.bank = Bank.first
ac.user = User.first
ac.save

Loan.create(balance: 100.5, online_banking_account_id: ac.id)
DepositAccount.create(balance: 300.5, online_banking_account_id: ac.id)

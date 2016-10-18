require 'bank'

describe Bank do

sample_statement = "date       || credit || debit   || balance
18/10/2016 ||        || 500.00  || 2500.00
18/10/2016 || 2000.00||         || 3000.00
18/10/2016 || 1000.00||         || 1000.00"

  describe 'account_balance' do
    it 'begins with a balance of 0 if passed no starting_balance' do
      bank = Bank.new
      expect(bank.account_balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'increases the account_balance by the passed argument' do
      bank = Bank.new
      bank.deposit(1000)
      expect(bank.account_balance).to eq 1000
    end
  end

  describe 'withdraw' do
    it 'decreases the account_balance by the passed argument' do
      bank = Bank.new
      bank.deposit(2000)
      bank.withdraw(500)
      expect(bank.account_balance).to eq 1500
    end
  end

  describe 'print_statement' do
    it 'prints all previous transactions including balance, date and debit/credit' do
      bank = Bank.new
      bank.deposit(1000)
      bank.deposit(2000)
      bank.withdraw(500)
      expect(bank.print_statement).to eq sample_statement
    end
  end
end


describe Transaction do

  describe 'initialize' do
    it 'takes an amount and a type' do
      transaction = Transaction.new(credit: 2000, balance: 3000)
      expect(transaction.credit).to eq 2000
    end
  end
end

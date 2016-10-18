require 'bank'

describe Bank do

  describe 'account_balance' do
    it 'begins with a balance of 0 if passed no starting_balance' do
      bank = Bank.new
      expect(bank.account_balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'increase the account_balance by the passed argument' do
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

end

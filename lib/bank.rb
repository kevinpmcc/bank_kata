class Bank

  attr_reader :account_balance

  def initialize
    @account_balance = 0
    @statement = []
  end
  
  def print_statement
    @statement
  end

  def deposit(amount)
    @account_balance += amount
    @statement << Transaction.new(debit: amount, balance: @account_balance)
  end

  def withdraw(amount)
    @account_balance -= amount
  end
  
end


class Transaction
attr_reader :credit, :debit, :date, :balance

  def initialize(credit: nil, debit: nil, balance:)
    @credit = credit
    @debit = debit
    @date = Date.new
    @balance = balance
  end
end

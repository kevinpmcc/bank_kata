class Bank

  attr_reader :account_balance

  def initialize
    @account_balance = 0
    @transactions = []
  end
  
  def print_statement
    statement = DisplayStatement.new(@transactions)
    statement.print_statement
  end

  def deposit(amount)
    @account_balance += amount
    @transactions << Transaction.new(credit: amount, balance: @account_balance)
  end

  def withdraw(amount)
    @account_balance -= amount
    @transactions << Transaction.new(debit: amount, balance: @account_balance)
  end
  
end


class Transaction
attr_reader :credit, :debit, :date, :balance

  def initialize(credit: nil, debit: nil, balance:)
    @credit = credit
    @debit = debit
    @date = Date.today
    @balance = balance
  end
end

class DisplayStatement
  def initialize(transactions)
    @printed_statement = "date       || credit || debit   || balance"
    transactions.reverse.map { |transaction|
    @printed_statement << "\n" + format_date(transaction.date) 
    @printed_statement <<  " || "  
    @printed_statement << (format_money(transaction.credit) || "       ") 
    @printed_statement << "|| "
    @printed_statement << (format_money(transaction.debit) || "      ")  
    @printed_statement << "  || " 
    @printed_statement << format_money(transaction.balance) 
    }
  end

  def print_statement
    @printed_statement
  end

  def format_money(amount)
    if amount == nil
      return nil
    else
    '%.2f' % amount 
    end
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

      
end

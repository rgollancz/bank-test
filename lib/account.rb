require 'time'

class Account
  attr_reader :owner, :balance, :transactions

  MINIMUM_BALANCE = 0

  def initialize(owner,balance = 0)
    @owner = owner
    @balance = balance
    @transactions = []
  end

  def withdraw(date=Time.new,amount)
    save_transaction(date,-amount,@balance)
    reduce_balance(amount)
  end

  def deposit(date=Time.new,amount)
    save_transaction(date,amount,@balance)
    increase_balance(amount)
  end

  def print_statement
    print_headers
    @transactions.each { |t| puts format_transaction(t) }
  end

  private

  def reduce_balance(amount)
    @balance -= amount
  end

  def increase_balance(amount)
    @balance += amount
  end

  def save_transaction(date,amount,balance)
    @transactions.push({ date: date, amount: amount, balance: balance })
  end

  def format_transaction(transaction)
    format_date(transaction[:date]) +
  end

  def format_date(date)
    "#{date.strftime("%I:%M%p")}"
  end


end

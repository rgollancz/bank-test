require 'time'
require_relative 'transaction'

class Account
  attr_reader :owner, :balance, :transactions

  def initialize(owner,balance = 0)
    @owner = owner
    @balance = balance
    @transactions = []
  end

  def withdraw(date=Time.new,amount)
    reduce_balance(amount)
    save_transaction(date,-amount)
  end

  def deposit(date=Time.new,amount)
    increase_balance(amount)
    save_transaction(date,amount)
  end

  def print_statement
    puts statement_headers
    @transactions.each { |t| puts format_transaction(t) }
  end

  private

  def reduce_balance(amount)
    @balance -= amount
  end

  def increase_balance(amount)
    @balance += amount
  end

  def save_transaction(date,amount)
    @transactions.push(Transaction.new(date,amount,@balance))
  end

  def format_transaction(transaction)
    date = format_date(transaction.date)
    amount = format_amount(transaction.amount)
    balance = format_balance(transaction.amount,transaction.balance)
    "#{date}" + "#{amount}" + "     #{balance}"
  end

  def format_date(date)
    "#{date.strftime("%d/%m/%Y")}  "
  end

  def format_amount(amount)
    amount >0 ? "  #{amount}" : "            #{amount.abs}"
  end

  def format_balance(amount, balance)
    amount >0 ? "              #{balance}" : "     #{balance}"
  end

  def statement_headers
    "date       || credit || debit   || balance"
  end

end

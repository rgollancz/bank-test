require 'time'
require_relative 'transaction'
require_relative 'statement'

class Account
  include Statement

  attr_reader :owner, :balance, :transactions

  def initialize(owner,balance = 0)
    @owner = owner
    @balance = balance
    @transactions = []
  end

  def withdraw(date,amount)
    reduce_balance(amount)
    save_transaction(date,-amount)
  end

  def deposit(date,amount)
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

end

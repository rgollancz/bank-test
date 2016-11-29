class Account
  attr_reader :owner, :balance, :withdrawals, :deposits

  MINIMUM_BALANCE = 0

  def initialize(owner,balance = 0)
    @owner = owner
    @balance = balance
    @withdrawals = []
    @deposits = []
  end

  def withdraw(amount)

  end


end

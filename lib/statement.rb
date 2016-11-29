module Statement

  def format_transaction(transaction)
    amount = format_amount(transaction.amount)
    balance = format_balance(transaction.amount,transaction.balance)
    "#{transaction.date} ||" + "#{amount}" + "#{balance}"
  end

  def format_amount(amount)
    a = "#{"%.2f" % amount.abs}"
    debit_space = "            "
    space_after = " " * (11-(a.length))
    amount >0 ? (" #{a}" + space_after + "||")  : (debit_space + "|| #{a}" + space_after)
  end

  def format_balance(amount, balance)
    amount >0 ? "             || #{"%.2f" % balance}" : " || #{"%.2f" % balance}"
  end

  def statement_headers
    "date       || credit     || debit       || balance"
  end
end

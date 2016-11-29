module Statement

  def format_transaction(transaction)
    amount = format_amount(transaction.amount)
    balance = format_balance(transaction.amount,transaction.balance)
    "#{transaction.date}" + "#{amount}" + "     #{balance}"
  end

  def format_amount(amount)
    amount >0 ? "  #{"%.2f" % amount}" : "            #{"%.2f" % amount.abs}"
  end

  def format_balance(amount, balance)
    amount >0 ? "              #{balance}" : "     #{balance}"
  end

  def statement_headers
    "date       || credit || debit   || balance"
  end
end

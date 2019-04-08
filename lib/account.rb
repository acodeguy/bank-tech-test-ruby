class Account

  def initialize
    @balance = 0
    @transactions = []
  end

  def balance
    @balance
  end

  def transactions
    @transactions
  end

  def deposit(amount:, date:)
    raise 'Cannot deposit negative amounts!' unless amount.positive?
    @balance += amount
    @transactions.push({date => amount})
  end

  def withdraw(amount:, date:)
    raise 'Cannot withdraw negative amounts!' unless amount.positive?
    @balance -= amount
    @transactions.push({date => amount})
  end
end

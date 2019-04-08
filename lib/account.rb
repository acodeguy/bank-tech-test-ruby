class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount:, date: Date.today)
    raise 'Cannot deposit negative amounts!' unless amount.positive?
    @balance += amount
    @transactions.push(Transaction.new(date: date, amount: amount, type: :credit, balance: @balance))
  end

  def withdraw(amount:, date: Date.today)
    raise 'Cannot withdraw negative amounts!' unless amount.positive?
    @balance -= amount
    @transactions.push(Transaction.new(date: date, amount: amount, type: :debit, balance: @balance))
  end

  def statement
    Statement.new(@transactions)
  end
end

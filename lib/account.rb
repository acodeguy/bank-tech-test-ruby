class Account

  attr_reader :balance, :transaction_log

  def initialize(transaction_log = TransactionLog.new)
    @balance = 0
    @transaction_log = transaction_log
  end

  def deposit(amount:, date: Date.today)
    raise 'Cannot deposit negative amounts!' unless amount.positive?
    @balance += amount
    @transaction_log.add_item(Transaction.new(date: date, amount: amount, type: :credit, balance: @balance))
  end

  def withdraw(amount:, date: Date.today)
    raise 'Cannot withdraw negative amounts!' unless amount.positive?
    @balance -= amount
    @transaction_log.add_item(Transaction.new(date: date, amount: amount, type: :debit, balance: @balance))
  end

  def statement
    Statement.new(@transaction_log).print_out.each do |line|
      puts line
    end
  end
end

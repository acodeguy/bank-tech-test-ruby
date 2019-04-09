require 'date'

class Account

  attr_reader :balance, :transaction_log

  def initialize(transaction_log = TransactionLog.new)
    @balance = 0
    @transaction_log = transaction_log
  end

  def transact(type:, date: Date.today, amount:)
    case type
    when :credit
      raise 'Cannot deposit negative amounts!' unless amount.positive?
      @balance += amount
    when :debit
      raise 'Cannot withdraw negative amounts!' unless amount.positive?
      @balance -= amount
    end
    @transaction_log.add_item(Transaction.new(date: date, amount: amount, type: type, balance: @balance))
  end

  def statement
    Statement.new(@transaction_log).print_out.each do |line|
      puts line
    end
  end
end

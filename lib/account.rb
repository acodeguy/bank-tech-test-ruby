require 'date'

# the account, owned by one single user
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
    transaction = Transaction.new(date: date, amount: amount, type: type, balance: @balance)
    @transaction_log.add_item(transaction)
  end

  def statement(statement = Statement.new(@transaction_log))
    statement.print_out.each do |line|
      puts line
    end
  end
end

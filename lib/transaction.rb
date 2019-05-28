# A single transaction made on an account
class Transaction
  attr_reader :date, :amount, :type, :balance

  def record(date: Date.today, amount:, type:, balance:)
    @amount = amount
    @date = date
    @type = type
    @balance = balance
  end
end

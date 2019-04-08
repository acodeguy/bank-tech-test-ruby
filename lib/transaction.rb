class Transaction

  attr_reader :date, :amount, :type, :balance

  def initialize(date: Date.today, amount:, type:, balance:)
    @amount = amount
    @date = date
    @type = type
    @balance = balance
  end
end

class Transaction

  attr_reader :date, :amount, :type, :new_balance

  def initialize(date:, amount:, type:, new_balance:)
    @amount = amount
    @date = date
    @type = type
    @new_balance = new_balance
  end
end

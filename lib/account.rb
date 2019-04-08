class Account

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount:)
    raise 'Cannot deposit negative amounts!' unless amount.positive?
    @balance += amount
  end
end

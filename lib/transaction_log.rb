class TransactionLog

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(transaction)
    @items.push(transaction)
  end

end

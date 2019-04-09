class Statement

  def initialize(transaction_log = TransactionLog.new)
    @statement =  ['date || credit || debit || balance']
    @transaction_log = transaction_log
  end

  def print_out
    @transaction_log.items.reverse.each do |t|
      @statement.push("#{format_date(t.date)} || #{format_number(t.amount)} || || #{format_number(t.balance)}") if t.type == :credit
      @statement.push("#{format_date(t.date)} || || #{format_number(t.amount)} || #{format_number(t.balance)}") if t.type == :debit
    end
    @statement
  end

  private

  def format_number(number)
    '%.2f' % number
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

end

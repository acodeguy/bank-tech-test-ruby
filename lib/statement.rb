# a statement of account activity at the time requested
class Statement
  attr_reader :statement

  def initialize(transaction_log = TransactionLog.new)
    @statement = ['date || credit || debit || balance']
    @transaction_log = transaction_log
  end

  def print_out
    @transaction_log.items.reverse_each do |t|
      credit_line = "#{format_date(t.date)} || #{format_number(t.amount)} || || #{format_number(t.balance)}"
      @statement.push(credit_line) if t.type == :credit
      debit_line = "#{format_date(t.date)} || || #{format_number(t.amount)} || #{format_number(t.balance)}"
      @statement.push(debit_line) if t.type == :debit
    end
    @statement
  end

  private

  def format_number(number)
    format('%.2f', number)
  end

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end
end

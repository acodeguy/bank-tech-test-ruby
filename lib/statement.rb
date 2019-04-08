class Statement

  def initialize(transactions = [])
    @statement =  ['date || credit || debit || balance']
    @transactions = transactions
  end

  def print_out
    @transactions.reverse.each do |t|
      @statement.push("#{t[:date]} || #{ format_number(t[:amount])} || || #{format_number(t[:balance])}") if t[:type] == :credit
      @statement.push("#{t[:date]} || || #{format_number(t[:amount])} || #{format_number(t[:balance])}") if t[:type] == :debit
    end
    @statement
  end

  private

  def format_number(number)
    '%.2f' % number
  end

end

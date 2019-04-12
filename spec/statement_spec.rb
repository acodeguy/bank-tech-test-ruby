require './lib/statement'

# unit tests for the Statement class
describe Statement do
  it 'prints a statement with all of its transactions' do
    transaction_log = TransactionLog.new
    transaction1 = Transaction.new(date: Date.new(2012, 1, 10), amount: 1000, type: :credit, balance: 1000)
    transaction2 = Transaction.new(date: Date.new(2012, 1, 13), amount: 2000, type: :credit, balance: 3000)
    transaction3 = Transaction.new(date: Date.new(2012, 1, 14), amount: 500, type: :debit, balance: 2500)
    transaction_log.add_item(transaction1)
    transaction_log.add_item(transaction2)
    transaction_log.add_item(transaction3)

    print_out = [
      'date || credit || debit || balance',
      '14/01/2012 || || 500.00 || 2500.00',
      '13/01/2012 || 2000.00 || || 3000.00',
      '10/01/2012 || 1000.00 || || 1000.00'
    ]
    statement = Statement.new(transaction_log)
    expect(statement.print_out).to eq print_out
  end
end

require './lib/statement'

# unit tests for the Statement class
describe Statement do
  it 'prints a statement with all of its transactions' do
    transaction = double('Transaction')
    allow(transaction).to receive_messages(
      date: Date.today,
      type: :credit,
      amount: 100,
      balance: 100
    )
    items = [transaction]

    transaction_log = double('Transaction Log')
    allow(transaction_log).to receive_messages(items: items)

    print_out = [
      'date || credit || debit || balance',
      "#{Date.today.strftime('%d/%m/%Y')} || 100.00 || || 100.00"
    ]
    statement = Statement.new(transaction_log)
    expect(statement.print_out).to eq print_out
  end
end

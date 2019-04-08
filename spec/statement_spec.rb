require './lib/statement'

describe Statement do

  it 'prints a statement with al lof its transactions' do
    transactions = [
      { date: '10/01/2012', amount: 1000, type: :credit, balance: 1000 },
      { date: '13/01/2012', amount: 2000, type: :credit, balance: 3000 },
      { date: '14/01/2012', amount: 500, type: :debit, balance: 2500 }
    ]
    print_out = [
      'date || credit || debit || balance',
      '14/01/2012 || || 500.00 || 2500.00',
      '13/01/2012 || 2000.00 || || 3000.00',
      '10/01/2012 || 1000.00 || || 1000.00'
    ]
    statement = Statement.new(transactions)
    expect(statement.print_out).to eq print_out
  end
end
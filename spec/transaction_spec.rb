require './lib/transaction'

describe Transaction do
  it 'stores details of a withdrawl or deposit' do
    transaction = Transaction.new(date: '10/01/2012', amount: 500, type: :credit, new_balance: 500)
    expect(transaction.amount).to eq 500
    expect(transaction.date).to eq '10/01/2012'
    expect(transaction.type).to eq :credit
    expect(transaction.new_balance).to eq 500
  end
end

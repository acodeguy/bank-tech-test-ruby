require './lib/transaction'
require 'date'

describe Transaction do
  it 'stores details of a withdrawl or deposit' do
    transaction = Transaction.new(amount: 500, type: :credit, balance: 500)
    expect(transaction.amount).to eq 500
    expect(transaction.date).to eq Date.today
    expect(transaction.type).to eq :credit
    expect(transaction.balance).to eq 500
  end

  it 'stores the current date if left-off' do
    transaction = Transaction.new(amount: 250, type: :credit, balance: 250)
    expect(transaction.date).to eq Date.today
  end
end
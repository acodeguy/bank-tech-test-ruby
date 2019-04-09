require './lib/transaction_log'

describe TransactionLog do

  it 'can add a new transaction to its items list' do
    trans_log = TransactionLog.new
    expect(trans_log.items.count).to eq 0
    trans_log.add_item(Transaction.new(date: Date.today, amount: 500, type: :credit, balance: 500))
    expect(trans_log.items.count).to eq 1
  end
end

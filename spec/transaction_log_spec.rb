require './lib/transaction_log'

describe TransactionLog do
  it 'can add a new transaction to its items list' do
    trans_log = TransactionLog.new
    expect(trans_log.items.count).to eq 0
    transaction_double = double('Transaction, 500, credit, balance 500')
    trans_log.add_item(transaction_double)
    expect(trans_log.items.count).to eq 1
  end
end

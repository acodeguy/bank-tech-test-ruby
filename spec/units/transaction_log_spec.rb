require './lib/transaction_log'

describe TransactionLog do
  it 'can add a new transaction to its items list' do
    trans_log = TransactionLog.new
    expect(trans_log.items.count).to eq 0
    transaction = double('Transaction')
    allow(transaction).to receive_messages(
      date: Date.today,
      type: :credit,
      amount: 100,
      balance: 100
    )
    trans_log.add_item(transaction)
    expect(trans_log.items.count).to eq 1
    expect(trans_log.items[0]).to eq transaction
  end
end

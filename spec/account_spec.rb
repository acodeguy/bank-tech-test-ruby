require './lib/account'
require 'date'

describe Account do

  before(:each) do
    @account = Account.new
  end

  it 'has a starting balance of zero' do
    expect(@account.balance).to eq 0
  end

  context '#transact' do
    it 'does not accept negative amounts' do
      expect { @account.transact(type: :credit, amount: -100) }.to raise_error 'Cannot deposit negative amounts!'
      expect { @account.transact(type: :debit, amount: -100) }.to raise_error 'Cannot withdraw negative amounts!'
    end

    it 'decreases the balance by the withdrawn amount' do
      @account.transact(type: :debit, amount: 100)
      expect(@account.balance).to eq -100
    end

    it 'increases the balance by the deposited amount' do
      @account.transact(type: :credit, amount: 50)
      expect(@account.balance).to eq 50
    end
  end

  it 'creates a new transaction for deposits and withdrawals' do
    @account.transact(type: :credit, amount: 50)
    expect(@account.transaction_log.items[0]).to be_a Transaction
    @account.transact(type: :debit, amount: 50, date: Date.today)
    expect(@account.transaction_log.items[1]).to be_a Transaction
    expect(@account.transaction_log).to be_a TransactionLog
  end
end

require './lib/account'
require 'date'

describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'has a starting balance of zero' do
    expect(@account.balance).to eq 0
  end

  it '#transact does not accept negative amounts' do
    expect { @account.transact(type: :credit, amount: -100) }.to raise_error 'Cannot deposit negative amounts!'
    expect { @account.transact(type: :debit, amount: -100) }.to raise_error 'Cannot withdraw negative amounts!'
  end

  it '#transact decreases the balance by the withdrawn amount' do
    @account.transact(type: :debit, amount: 100)
    expect(@account.balance).to eq(-100)
  end

  it '#transact increases the balance by the deposited amount' do
    @account.transact(type: :credit, amount: 50)
    expect(@account.balance).to eq 50
  end

  it '#transact creates a new transaction for deposits' do
    @account.transact(type: :credit, amount: 50)
    expect(@account.transaction_log.items[0]).to be_a Transaction
  end

  it '#transact creates a new transaction for withdrawals' do
    @account.transact(type: :debit, amount: 50)
    expect(@account.transaction_log.items[0]).to be_a Transaction
  end
end

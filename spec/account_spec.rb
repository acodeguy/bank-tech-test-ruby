require './lib/account'

describe Account do

  before(:each) do
    @account = Account.new
  end

  it 'has a starting balance of zero' do
    expect(@account.balance).to eq 0
  end

  it 'does not accept negative numbers' do
    expect { @account.deposit(amount: -100, date: '08-04-2019') }.to raise_error 'Cannot deposit negative amounts!'
    expect { @account.withdraw(amount: -100, date: '08-04-2019') }.to raise_error 'Cannot withdraw negative amounts!'
  end

  it 'stores a date along with the amount in its transcation log' do
    @account.deposit(amount: 50, date: '08-04-2019')
    expect(@account.transactions.any? { |trn| trn['08-04-2019'] }).to be true
    @account.withdraw(amount: 50, date: '09-04-2019')
    expect(@account.transactions.any? { |trn| trn['09-04-2019'] }).to be true
  end

  context '#deposit' do
    it 'incresses its balance by the deposited amount' do
      @account.deposit(amount: 100, date: '08-04-2019')
      expect(@account.balance).to eq 100
    end
  end

  context '#withdraw' do
    it 'decreases its balance by the withdrawn amount' do
      @account.withdraw(amount: 50, date: '08-04-2019')
      expect(@account.balance).to eq -50
    end
  end
end

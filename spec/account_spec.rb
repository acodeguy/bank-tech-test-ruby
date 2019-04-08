require './lib/account'

describe Account do

  before(:each) do
    @account = Account.new
  end

  it 'has a starting balance of zero' do
    expect(@account.balance).to eq 0
  end

  context '#deposit' do
    it 'incresses its balance by the deposited amount' do
      @account.deposit(amount: 100)
      expect(@account.balance).to eq 100
    end

    it 'does not accept negative numbers' do
      expect { @account.deposit(amount: -100) }.to raise_error 'Cannot deposit negative amounts!'
    end
  end
end

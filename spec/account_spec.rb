require './lib/account'

describe Account do
  it 'has a starting balance of zero' do
    account = Account.new
    expect(account.balance).to eq 0
  end
end

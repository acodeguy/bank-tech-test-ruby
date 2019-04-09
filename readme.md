# Bank Tech Test

# Using this Code
Run the following commands to get started with this code:

1. Clone the repo:
```
git clone https://github.com/acodeguy/bank-tech-test-ruby
```
2. Change into the newly-cloned directory:
```
cd bank-tech-test-ruby
```
3. Install required Gems:
```
bundle install
```
4. RUn the code in IRB:
```
irb -r ./lib/account.rb -r ./lib/statement.rb -r ./lib/transaction.rb -r ./lib/transaction_log.rb
```
Once IRB has loaded, here is how you interact with the Bank:
```
2.5.0 :006 > account = Account.new
 => #<Account:0x00007fd7b291f0c8 @balance=0, @transaction_log=#<TransactionLog:0x00007fd7b291f0a0 @items=[]>> 
2.5.0 :007 > account.transact(type: :credit, amount: 100)
 => [#<Transaction:0x00007fd7b18e6d28 @amount=100, @date=#<Date: 2019-04-09 ((2458583j,0s,0n),+0s,2299161j)>, @type=:credit, @balance=100>] 
2.5.0 :008 > account.transact(type: :debit, amount: 50)
 => [#<Transaction:0x00007fd7b18e6d28 @amount=100, @date=#<Date: 2019-04-09 ((2458583j,0s,0n),+0s,2299161j)>, @type=:credit, @balance=100>, #<Transaction:0x00007fd7b290e908 @amount=50, @date=#<Date: 2019-04-09 ((2458583j,0s,0n),+0s,2299161j)>, @type=:debit, @balance=50>] 
2.5.0 :009 > account.statement
date || credit || debit || balance
09/04/2019 || || 50.00 || 50.00
09/04/2019 || 100.00 || || 100.00
 => ["date || credit || debit || balance", "09/04/2019 || || 50.00 || 50.00", "09/04/2019 || 100.00 || || 100.00"] 
2.5.0 :010 > 
```

# User Stories

# Acceptance criteria
```
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see
```
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00|| || 3000.00
10/01/2012 || 1000.00|| || 1000.00
```
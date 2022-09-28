class BankAccount:
    balance = 0
    accounts = []
    # don't forget to add some default values for these parameters!
    def __init__(self, int_rate, balance): 
        self.int_rate = int_rate
        self.balance = balance
        BankAccount.accounts.append(self)
        # your code here! (remember, instance attributes go here)
        # don't worry about user info here; we'll involve the User class soon
    def deposit(self, amount):
        self.balance+=amount
        return self
        # your code here
    def withdraw(self, amount):
        if(self.balance - amount) >= 0:
            self.balance -= amount
        else:
            print("Insufficient Funds: Charging a $5 fee")
            self.balance -= 5
        return self
        # your code here
    def display_account_info(self):
        print('Balance: ' + str("{:.2f}".format(self.balance)))
        return self
        # your code here
    def yield_interest(self):
        if self.balance > 0:
            self.balance += (self.balance * self.int_rate)
        return self
        # increases the account balance by the current balance * the interest rate (as long as the balance is positive) 

    @classmethod
    def AllAccounts(cls):
        for account in cls.accounts:
            account.display_account_info()

    
account1 = BankAccount(0.05, 500)
account2 = BankAccount(0.09, 1000)

account1.deposit(500).deposit(100).deposit(400).withdraw(200).yield_interest().display_account_info()
account2.deposit(200).deposit(50).withdraw(100.5).withdraw(300).withdraw(60).withdraw(400).yield_interest().display_account_info()

BankAccount.AllAccounts()
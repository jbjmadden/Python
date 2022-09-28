from unicodedata import name


class BankAccount:
    balance = 0
    accounts = []

    def __init__(self, int_rate, balance): 
        self.int_rate = int_rate
        self.balance = balance
        BankAccount.accounts.append(self)

    def deposit(self, amount):
        self.balance+=amount
        return self

    def withdraw(self, amount):
        if(self.balance - amount) >= 0:
            self.balance -= amount
        else:
            print("Insufficient Funds: Charging a $5 fee")
            self.balance -= 5
        return self

    def yield_interest(self):
        if self.balance > 0:
            self.balance += (self.balance * self.int_rate)
        return self

    
class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email
        self.account1 = BankAccount(int_rate=0.02, balance=0)
        self.account2 = BankAccount(int_rate=0.02, balance=0)

    def deposit_method(self, amount, number):
        if number == 1:
            self.account1.deposit(amount)
        else:
            self.account2.deposit(amount)
        return self

    def withdrawal_method(self, amount, number):
        if number == 1:
            self.account1.withdraw(amount)
        else:
            self.account2.withdraw(amount)
        return self
        
    def display_user_balance(self):
        print(f'User: {self.name}, Checkings Balance: {self.account1.balance}')
        print(f'User: {self.name}, Savings Balance: {self.account2.balance}')

    def transfer_money(self, amount, other_user, number, number2):
        if number == 1 and number2 == 1:
            if self.account1.balance >= amount:
                self.account1.balance -= amount
                other_user.account1.balance += amount
        if number == 1 and number2 == 2:
            if self.account1.balance >= amount:
                self.account1.balance -= amount
                other_user.account2.balance += amount
        if number == 2 and number2 == 1:
            if self.account2.balance >= amount:
                self.account2.balance -= amount
                other_user.account1.balance += amount
        if number == 2 and number2 == 2:
            if self.account2.balance >= amount:
                self.account2.balance -= amount
                other_user.account2.balance += amount
        return self


user1 = User('Jason', 'jmadden@gmail.com')
user2 = User('Ari', 'awinter@gmail.com')

user1.deposit_method(1200, 1)
user1.deposit_method(1200, 2)
user2.deposit_method(1000, 1)
user2.deposit_method(1000, 2)
user1.withdrawal_method(100, 2)
user1.deposit_method(3000, 2)

user1.transfer_money(500, user2, 1, 2)
user1.transfer_money(500, user1, 2, 1)

user1.display_user_balance()
user2.display_user_balance()

class User():
    def __init__(self, first_name, last_name, email, age):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.age = age
        self.rewards_member = False
        self.card_points = 0

    def display_info(self):
        print("--------------------------")
        print(f"First name: {self.first_name}")
        print(f"Last name: {self.last_name}")
        print(f"Email: {self.email}")
        print(f"Age: {self.age}")
        print(f"Member: {self.rewards_member}")
        print(f"Current Points: {self.card_points}")
        print("--------------------------")

    def enroll(self):
        if self.rewards_member:
            print("User is already a member")
            return False
        else:
            self.rewards_member = True
            self.card_points = 200

    
    
    def spend_points(self, amount):
        if self.card_points < amount:
            print("You don't have enough points.")
        else:
            self.card_points -= amount
user = User("Jason", "Madden", "jbjmadden@gmail.com", 28)
user.enroll()
user.spend_points(50)
user.display_info()
user2 = User("Jack", "Bauer", "jbauer@gmail.com", 32)
user2.enroll()
user2.spend_points(80)
user2.display_info()
user3 = User("Ari", "Winter", "awinter@gmail.com", 21)
user3.spend_points(40)
user3.display_info()

user.enroll()
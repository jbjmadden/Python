from pets import Pet
from ninja import Ninja

my_treats = ['Burger','Bacon','Sandwich']
my_pet_food = ['Chicken','Salmon']

mona = Pet( "Mona", "Dog",["roll over", "sit"], 'silent whimper.')
nunja = Ninja('Jason','Madden',my_treats,my_pet_food, mona)

nunja.feed().feed().feed().walk().bathe().nap()
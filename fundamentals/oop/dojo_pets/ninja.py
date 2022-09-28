from pets import Pet


class Ninja(Pet):
    # implement __init__( first_name , last_name , treats , pet_food , pet )
    # implement the following methods:
    # walk() - walks the ninja's pet invoking the pet play() method
    # feed() - feeds the ninja's pet invoking the pet eat() method
    # bathe() - cleans the ninja's pet invoking the pet noise() method
    def __init__(self, first_name, last_name, treats, pet_food, pet):
        self.first_name = first_name
        self.last_name = last_name
        self.treats = treats
        self.pet_food = pet_food
        self.pet = pet

    def walk(self):
        self.pet.play()
        print(f'{self.pet.name} enjoyed the walk!')
        return self

    def feed(self):
        if len(self.pet_food) > 0:
            food = self.pet_food.pop()
            print(f"{self.pet.name} eats up some {food}.")
            self.pet.eat()
        else:
            print("You're out of food!")
        return self
    
    def bathe(self):
        self.pet.pNoise()
        return self

    def nap(self):
        self.pet.sleep()
        return self
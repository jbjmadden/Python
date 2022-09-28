class Pet:
    # implement __init__( name , type , tricks ):
    # implement the following methods:
    # sleep() - increases the pets energy by 25
    # eat() - increases the pet's energy by 5 & health by 10
    # play() - increases the pet's health by 5
    # noise() - prints out the pet's sound

    def __init__(self, name , type, tricks, noise):
        self.name = name
        self.type = type
        self.tricks = tricks
        self.health = 100
        self.energy = 50
        self.noise = noise


    def sleep(self):
        self.energy += 25
        print(f'{self.name} goes to sleep.')
        return self

    def play(self):
        self.health += 5
        self.energy -= 15
        return self

    def eat(self):
        self.energy += 5
        self.health += 10
        return self

    def pNoise(self):
        print(f'{self.name} lets out a {self.noise}')
        return self
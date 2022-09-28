#Challenge 1: Update the Constructor
#Update the constructor to accept a dictionary with a single player's
#information instead of individual arguments for the attributes.
class Player:
    def __init__(self, dict):
        self.name = dict["name"]
        self.age = dict["age"]
        self.position = dict["position"]
        self.team = dict["team"]

#Challenge 2: Create instances using individual player dictionaries.
#Given these variables, create Player instances for each of the following
# dictionaries. Be sure to instantiate these outside the class definition,
# in the outer scope.
kevin = {
        "name": "Kevin Durant", 
        "age":34, 
        "position": "small forward", 
        "team": "Brooklyn Nets"
}
jason = {
        "name": "Jason Tatum", 
        "age":24, 
        "position": "small forward", 
        "team": "Boston Celtics"
}
kyrie = {
        "name": "Kyrie Irving", 
        "age":32,
        "position": "Point Guard", 
        "team": "Brooklyn Nets"
}
    
# Create your Player instances here!
# player_jason = ???
player_kevin = Player(kevin["name"], kevin["age"], kevin["position"], kevin["team"])
player_jason = Player(jason)
player_kyrie = Player(kyrie)
print(player_kevin)
print(player_jason)
print(player_kyrie)


@classmethod
def get_team(cls, team_list):
    player_info = []
    for data in team_list:
        player_info.append(cls(data))
    return player_info
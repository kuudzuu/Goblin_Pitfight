class_name Goblin extends Node

var id: String
var hp: float
var atk: float
var spd: float

static func create(new_id, params) -> Goblin:
	var goblin = Goblin.new()
	goblin.id = new_id
	goblin.hp = params["hp"]
	goblin.atk = params["atk"]
	goblin.spd = params["spd"]
	return goblin

## Goblins should have a bank of methods for attacking etc (entirely dependent on atk implemnentation)
## that they simply have references to. Allows for easy editing (+ modding)
## i think if i approach this as "make it as easy as possible to mod"
## i will also make it as easy as possible to develop lmao
## TakeTurn()



## JSON Files will house all GOblin stats. (ALternatively could use Godot's built-in resources - we will not bc ppl can use it to inject code and pass on malware via pirated version of the game.
## if we json - they can still pirate bu t the user is protected.
## Each goblin Entry in the JSON will have the following base attributes:(THESE are meant to reflect base attributes - ones that do not change from game to game of goblin pit fight. Everything else about the goblin does.
##		
## 		int id, 
## 		int hp, 
##      int spd,
##		string name,
## 		string default_action, referring to the initial action of the goblin during its turn in combat. 
##								"default" bc:
##								For most - this will be attack, but
##  							maybe some goblins with High HP + DMG may call the "Wait()" turn function before swinging in huge the turn after 
##                              - this would require a unique function - or with this organization, 
##  							(This will be called during TakeTurn() in combat with the godot built-in Callable() function - there will be a class for "Turns" to be called on)"
##		string mesh_filename, (So that we can load ALL of the goblin's data ONLY when we are getting in game)
##		bool takes_turn, 
##		array[string] attributes, The list of attributes on the goblin. Great Flavoring tool here.
## Combat turns should add "cards to the next combat round's stack, and simple triggers like "bool takes_turn" are switched on and off on goblins from quriks/schemes/actions/effects/arenas/etc
## 		Since multiple sources conflict, if an effect is a binary 1 or 0, there shuold be some "nullification" between effects.
##			If we'd like to play off them, we should give the goblins temporary attributes that cards check for. Statuses, Reputations, Morales - all represnted the same way as little circles on the goblin cards.

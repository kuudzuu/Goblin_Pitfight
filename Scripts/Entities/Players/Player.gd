class_name Player extends Node

var id: String # internal
var username: String # player enters this for screen name

var GOBLINS: Dictionary # List of goblins this player has

# Creates new player instance (constructor)
static func create(new_id) -> Player:
	var player = Player.new()
	player.id = new_id
	return player

# Adds goblin to this player's GOBLINS
func add_goblin(goblin):
	GOBLINS[goblin["id"]] = goblin

## Goblins should have a bank of methods for attacking etc (entirely dependent on atk implemnentation)
## that they simply have references to. Allows for easy editing (+ modding)
## i think if i approach this as "make it as easy as possible to mod"
## i will also make it as easy as possible to develop lmao

class_name Player extends Node

var id: String # internal
var username: String # player enters this for screen name

var GOBLIN_SLOTS: Dictionary # List of goblins this player has

## Creates new player instance (constructor)
static func create(new_id) -> Player:
	var player = Player.new()
	player.id = new_id
	return player

## Adds goblin to this player's GOBLINS
## NOTE: Currently no checks to ensure all slots are filled, that there are only 3, etc.
func add_goblin_to_slot(goblin, slot):
	GOBLIN_SLOTS[slot] = goblin

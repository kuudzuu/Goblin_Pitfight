extends Node

var PLAYER = preload("res://Scripts/Entities/Players/Player.gd").new()
var PlayerDict: Dictionary

var curr_id = "a"

## TODO: AWFUL WAY TO DO IDS! FIX THIS LOL
func create_new_player():
	var id = curr_id
	curr_id += "a"
	PlayerDict[id] = PLAYER.create(id)
	return PlayerDict[id]

func add_goblin_to_player(player_id, goblin):
	if not PlayerDict.has(player_id):
		print("Nonexistent player, wtf lol")
	PlayerDict[player_id].add_goblin(goblin)

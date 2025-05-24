extends Node

var PLAYER = preload("res://Entities/Players/Player.gd").new()
var PlayerDict: Dictionary

func create_player(id):
	PlayerDict[id] = PLAYER.create(id)

func add_goblin_to_player(player_id, goblin):
	if not PlayerDict.has(player_id):
		print("Nonexistent player, wtf lol")
	PlayerDict[player_id].add_goblin(goblin)

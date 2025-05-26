extends Node

var GOBLIN = preload("res://Scripts/Entities/Goblins/Goblin.gd").new()

var GoblinData
var GoblinDict: Dictionary

func init():
	load_goblin_data()

func load_goblin_data():
	if not FileAccess.file_exists("res://Data/goblins.json"):
		print("WAAHHH")
		return
	var file = FileAccess.open("res://Data/goblins.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	GoblinData = data

func get_goblin_by_id(id) -> Goblin:
	if not GoblinDict.has(id):
		GoblinDict[id] = GOBLIN.create(id, GoblinData[id])
	return GoblinDict[id]

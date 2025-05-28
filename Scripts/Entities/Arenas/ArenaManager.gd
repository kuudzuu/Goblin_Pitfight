extends Node

var ArenaData: Dictionary

func init():
	load_arena_data()

func load_arena_data():
	if not FileAccess.file_exists("res://Data/arenas.json"):
		print("WAAHHH")
		return
	var file = FileAccess.open("res://Data/arenas.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	ArenaData = data

## Called when a game is starting a new round
## TODO: logic to ensure no duplicate arenas
func get_new_arena():
	var size = ArenaData.size()
	var random_key = ArenaData.keys()[randi() % size]
	var arena = ArenaData[random_key]
	return arena

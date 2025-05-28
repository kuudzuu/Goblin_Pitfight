class_name Game extends Node

var PLAYERS: Array
var CURRENT_ARENA

static func create() -> Game:
	var game = Game.new()
	return game

func _ready():
	pass

func add_player(player):
	PLAYERS.append(player)

func set_arena(arena):
	CURRENT_ARENA = arena
	print(arena)

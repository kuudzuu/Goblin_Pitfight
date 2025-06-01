extends Node

var SCREEN_MANAGER
var GAME_INTERFACE

func init(ScreenManager, GameInterface):
	SCREEN_MANAGER = ScreenManager
	GAME_INTERFACE = GameInterface

func connect_signals(scene):
	print("yea")
	match scene.NAME:
		"Title":
			pass
		"Mode":
			scene.players_chosen.connect(create_game)

func create_game(num):
	print("Gonna create a game")
	pass

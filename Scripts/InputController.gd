extends Node

var SCREEN_MANAGER
var GAME_INTERFACE

func init(ScreenManager, GameInterface):
	SCREEN_MANAGER = ScreenManager
	GAME_INTERFACE = GameInterface

func connect_signals(scene):
	match scene.NAME:
		pass
	print(scene.NAME)

## This is ALWAYS the root node.
## Does not have much in it.
## Initializes SCREEN_SCENE, which does most of the processing
## Holds some variables for global data and such lol
## Idk what the Root Of All Roots "Master" scene is SUPPOSED to do
## But it seems like it should be too meta level to even handle screen changes
## So tada

extends Node

@onready var SCREEN_MANAGER_SCENE = preload("res://Scenes/ScreenManager.tscn")
@onready var INPUT_CONTROLLER = preload("res://Scripts/InputController.gd").new()
@onready var GAME_INTERFACE = preload("res://Scripts/GameInterface.gd").new()
var SCREEN_MANAGER

# Builtin ======================================================================

## First thing that runs in the entire game lol
func _ready():
	SCREEN_MANAGER = SCREEN_MANAGER_SCENE.instantiate()
	add_child(SCREEN_MANAGER)
	
	INPUT_CONTROLLER.init(SCREEN_MANAGER, GAME_INTERFACE)
	GAME_INTERFACE.init(INPUT_CONTROLLER)
	SCREEN_MANAGER.init(INPUT_CONTROLLER)
	
	SCREEN_MANAGER.run()

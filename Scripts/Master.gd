## This is ALWAYS the root node of the scene being shown
## Initializes major scenes and managers, connects them,
## then runs the program. That's all.

extends Node

@onready var SCREEN_MANAGER_SCENE = preload("res://Scenes/ScreenManager.tscn")
@onready var INPUT_CONTROLLER_SCENE = preload("res://Scenes/InputController.tscn")
@onready var SWITCHBOARD = preload("res://Scripts/Switchboard.gd").new()
@onready var GAME_INTERFACE = preload("res://Scripts/GameInterface.gd").new()

var SCREEN_MANAGER
var INPUT_CONTROLLER

# Builtin ======================================================================

## First thing that runs in the entire game lol
func _ready():
	# Create InputController scene (direct child)
	INPUT_CONTROLLER = INPUT_CONTROLLER_SCENE.instantiate()
	add_child(INPUT_CONTROLLER)
	
	# Create SCREEN_MANAGER (direct child of InputController)
	SCREEN_MANAGER = SCREEN_MANAGER_SCENE.instantiate()
	
	# Init all major scenes and managers
	INPUT_CONTROLLER.init(SWITCHBOARD, SCREEN_MANAGER)
	SWITCHBOARD.init(SCREEN_MANAGER, GAME_INTERFACE)
	GAME_INTERFACE.init(SWITCHBOARD)
	SCREEN_MANAGER.init(SWITCHBOARD)
	
	# Run the program
	SCREEN_MANAGER.run()

## This is ALWAYS the root node.
## Does not have much in it.
## Initializes SCREEN_SCENE, which does most of the processing
## Holds some variables for global data and such lol
## Idk what the Root Of All Roots "Master" scene is SUPPOSED to do
## But it seems like it should be too meta level to even handle screen changes
## So tada

extends Node

@onready var GPMANAGER_SCENE = preload("res://Scenes/GPManager.tscn")

# Builtin ======================================================================

## First thing that runs in the entire game lol
## Creates all players (demo only)
func _ready():
	var GP_Manager = GPMANAGER_SCENE.instantiate()
	add_child(GP_Manager)

## This is ALWAYS the root node.
## When GP is opened, this creates and runs the Intro scene
## When the Intro scene signals that a game has started,
## the Intro scene is deleted (with important info extracted)
## and a Game scene starts, which does everything else
## I think this will let us create multiple games in parallel, leading to multiplayering

extends Node

@onready var INTRO_SCENE = preload("res://Scenes/Intro.tscn")

# Builtin ======================================================================

## First thing that runs in the entire game lol
## Creates all players (demo only)
func _ready():
	start_intro()

func start_intro():
	var Intro = INTRO_SCENE.instantiate()
	add_child(Intro)

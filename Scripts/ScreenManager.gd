## Always the direct child of Master.
## Created to handle what screen is currently shown to the player, regardles sof if they are in game or out of game
## Also, handles meta-level user input via keyboard (i.e. "esc" during Intro scenes)
## When GP is opened, this is created. This then creates and runs the Intro scene
## When the Intro scene signals that a game has started,
## the Intro scene is deleted (with important info extracted)
## and a Game scene starts, which does everything else
## I think this will let us create multiple games in parallel, leading to multiplayering

## This runs the player through to picking their game mode
## Once a game mode is picked, a Game is created, and running is passed off to the game

extends Node

## List of possible Screens
@onready var TITLE_SCREEN = preload("res://Scenes/Screens/Title.tscn")
@onready var MODE_SCREEN = preload("res://Scenes/Screens/Mode.tscn")
@onready var MATCHING_SCREEN = preload("res://Scenes/Screens/Matching.tscn")
@onready var PITFIGHT_SCREEN = preload("res://Scenes/Screens/Pitfight.tscn")

## Reference to InputController (throughway to communicate with game interface)
## I figure user input should always be routed through a central area dedicated to it
var INPUT_CONTROLLER

## What scene is loaded right now?
## Direct reference to scene
var CURRENT_SCREEN

# Builtin ======================================================================

## Used to parse user input
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		reverse_screen()

## Manually run by Master when created
## Gives reference to InputController.gd
func init(InputController):
	INPUT_CONTROLLER = InputController

## Essentially the "start button" for the screens of the game to show
## Because only one start, only one run, so it is hardcoded:
## Opens the title lol
func run():
	open_screen("Title")

## Advances screens (i.e. pressing "Start" on the Title screen)
## Currently, there is no variable for screen order, order is hardcoded
func advance_screen():
	print("advancingadvancing")
	match CURRENT_SCREEN.NAME:
		"Title":
			switch_to_screen("Mode")
		"Mode":
			switch_to_screen("Matching")
		"Matching":
			switch_to_screen("Pitfight")
	pass

## Opposite of advance. Quits game on Title
func reverse_screen():
	match CURRENT_SCREEN.NAME:
		"Title":
			close_screen(CURRENT_SCREEN)
			quit_game()
		"Mode":
			switch_to_screen("Title")
		"Matching":
			switch_to_screen("Mode")
		"Pitfight":
			switch_to_screen("Title")
	pass

## Closes current scene, opens specified scene
func switch_to_screen(screen_name):
	close_screen(CURRENT_SCREEN)
	open_screen(screen_name)

## Opens specified screen
func open_screen(screen_name):
	var new_screen
	
	match screen_name:
		"Title":
			new_screen = TITLE_SCREEN.instantiate()
		"Mode":
			new_screen = MODE_SCREEN.instantiate()
		"Matching":
			new_screen = MATCHING_SCREEN.instantiate()
		"Pitfight":
			new_screen = PITFIGHT_SCREEN.instantiate()
			
	add_child(new_screen)
	CURRENT_SCREEN = new_screen
	connect_signals(new_screen)

# Closes referenced scene
func close_screen(screen):
	screen.close()
	screen.queue_free()
	pass

## Custom logic per scene to connect their signals
## Relevant signals are connected here and in InputController
## TODO: See if they should be connected entirely from here or from InputController or not
func connect_signals(screen):
	match screen.NAME:
		"Title":
			screen.advance_screen.connect(advance_screen)
		"Mode":
			screen.advance_screen.connect(advance_screen)
	
	INPUT_CONTROLLER.connect_signals(screen)

## Player has pressed the "Settings" button on the title screen
## TODO
func open_settings():
	print("TODO: Settings menu")

## Player has pressed the "Quit" button on the title screen
## Or has pressed ESC on the title screen
func quit_game():
	get_tree().quit()

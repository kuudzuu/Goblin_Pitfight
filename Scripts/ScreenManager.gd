## Direct child of master
## Handles switching between screens
## No logic abt when screens should be switched is present here:
## this is purely functionality to switch screens, triggered by other code (signals)
extends Node

## List of possible Screens
@onready var TITLE_SCREEN = preload("res://Scenes/Screens/Title.tscn")
@onready var MODE_SCREEN = preload("res://Scenes/Screens/Mode.tscn")
@onready var MATCHING_SCREEN = preload("res://Scenes/Screens/Matching.tscn")
@onready var PITFIGHT_SCREEN = preload("res://Scenes/Screens/Pitfight.tscn")

## Reference to Switchboard (throughway to communicate with game interface)
## I figure user input should always be routed through a central area dedicated to it
var SWITCHBOARD

## What scene is loaded right now?
## Direct reference to scene
var CURRENT_SCREEN

# Builtin ======================================================================

## Manually called by Master when created
## Gives reference to Switchboard.gd
func init(Switchboard):
	SWITCHBOARD = Switchboard

## Essentially the "start button" of the entire game (visually)
## Because only one start, only one run, so it is hardcoded
## Opens the title lol
func run():
	open_screen("Title")

## Advances screens (i.e. pressing "Start" on the Title screen)
## Currently, there is no variable for screen order, order is hardcoded
func advance_screen():
	match CURRENT_SCREEN.NAME:
		"Title":
			switch_to_screen("Mode")
		"Mode":
			switch_to_screen("Matching")
		"Matching":
			switch_to_screen("Pitfight")

## Opposite order of advance. Quits game on Title
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

## Closes current scene, opens specified scene
func switch_to_screen(screen_name):
	close_screen(CURRENT_SCREEN)
	open_screen(screen_name)

## Opens specified screen
## Triggers Switchboard to connect signals where they need to go (coded manually)
## Adds new scene as a child
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
	
	CURRENT_SCREEN = new_screen
	SWITCHBOARD.connect_screen_signals(new_screen)
	add_child(new_screen)

# Closes referenced scene
func close_screen(screen):
	screen.close()
	screen.queue_free()

## Player has pressed the "Settings" button on the title screen
## TODO
func open_settings():
	print("TODO: Settings menu")

## Player has pressed the "Quit" button on the title screen
## Or has pressed ESC on the title screen
func quit_game():
	get_tree().quit()

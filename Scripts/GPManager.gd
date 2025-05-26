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

@onready var TITLE_SCENE = preload("res://Scenes/Screens/Title.tscn")
@onready var MODE_SELECT_SCENE = preload("res://Scenes/Screens/ModeSelect.tscn")
@onready var GAME_MANAGER_SCENE = preload("res://Scenes/GameManager.tscn")

var GAME_MANAGER: Node2D
var CURRENT_SCENE: String

# Builtin ======================================================================

## Run on initialization
## This is created once when Goblin pitfight is first opened, and stays
## Since the first thing we want to see if the title,
## This opens the title
func _ready():
	open_title()

## Used to parse user input
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		go_back()

## Prob will contain a lot of logic. Goes back a screen.
## "Forwards order" is essentially top to bottom of the match statement
## Each case has slightly different logic, however
func go_back():
	match CURRENT_SCENE:
		"Title":
			quit_game()
		"ModeSelect":
			close_by_group("ModeSelect")
			open_title()
		"Draft":
			GAME_MANAGER.close()
			GAME_MANAGER = null
			close_by_group("GameManager")
			open_mode_select()


## Opens title scene
## Connects title signals
func open_title():
	var Title = TITLE_SCENE.instantiate()
	add_child(Title)
	
	Title.start_game.connect(start_game)
	Title.quit_game.connect(quit_game)
	Title.open_settings.connect(open_settings)
	
	CURRENT_SCENE = "Title"

## Opens title scene
## Connects title signals
func open_mode_select():
	var ModeSelect = MODE_SELECT_SCENE.instantiate()
	add_child(ModeSelect)
	
	ModeSelect.players_chosen.connect(create_and_run_game_with_players)
	
	CURRENT_SCENE = "ModeSelect"

## Deallocates the memory used by everything in the specified group
## Groups are set manually on Scene root nodes in the metadata
## Bottom of the "Inspector" tab on root node of each scene
func close_by_group(group):
	var children = get_children()
	for child in children:
		if child.get_meta("Group", "null") == group:
			child.queue_free()

## Player has pressed the "Start" button on the title screen
## Change to ModeSelect
func start_game():
	close_by_group("Title")
	open_mode_select()

## Player has pressed the "Quit" button on the title screen
## Or has pressed ESC on the title screen
func quit_game():
	close_by_group("Title")
	get_tree().quit()

## Player has pressed the "Settings" button on the title screen
## TODO
func open_settings():
	print("TODO: Settings menu")

## When a game has started and GAME_MANAGER has taken over processing,
## This file still handles screen transitions.
## To do this, GAME_MANAGER will emit signal scene_change with name of new scene
## That signal causes this to be called, registering the scene change
## (As of now) mostly just used for go_back()
func register_scene_change(scene_name):
	CURRENT_SCENE = scene_name

# Signals from "ModeSelect" ====================================================

## The Player is no longer futsing around in the main menus, and has chosen to enter a game.
## This function creates and starts a GAME_MANAGER scene, which essentially means a self-contained game has started.
## Processing now is handed over to the GameManager scene
func create_and_run_game_with_players(num_players):
	GAME_MANAGER = GAME_MANAGER_SCENE.instantiate()
	GAME_MANAGER.scene_change.connect(register_scene_change)
	get_parent().add_child(GAME_MANAGER)
	GAME_MANAGER.start(num_players)
	close_by_group("ModeSelect")

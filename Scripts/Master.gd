extends Node

@onready var TITLE_SCENE = preload("res://Scenes/Title.tscn")
@onready var DRAFT_SCENE = preload("res://Scenes/Draft.tscn")

var PLAYER_MANAGER = preload("res://Entities/Players/PlayerManager.gd").new()

var CURRENT_SCENE: String

# Builtin ======================================================================

## First thing that runs in the entire game lol
## Creates all players (demo only)
func _ready():
	PLAYER_MANAGER.create_player("Player1")  # hardcoded for now bc singleplayer demo thangs :P
	open_title()

## Prob will contain a lot of logic. Goes back a screen.
## Forwards order: Title -> Draft
func go_back():
	match CURRENT_SCENE:
		"Title":
			quit_game()
		"Draft":
			close_draft()
			open_title()

# Scene Management =============================================================

## Opens title scene
## Connects title signals
func open_title():
	var Title = TITLE_SCENE.instantiate()
	add_child(Title)
	
	Title.start_game.connect(start_game)
	Title.quit_game.connect(quit_game)
	Title.open_settings.connect(open_settings)
	
	CURRENT_SCENE = "Title"

## Closes title scene
func close_title():
	close_by_group("Title")

## Opens draft scene
## Connects draft signals
func open_draft():
	var Draft = DRAFT_SCENE.instantiate()
	add_child(Draft)
	
	Draft.goblin_picked.connect(assign_goblin_to_player)
	
	CURRENT_SCENE = "Draft"

## Closes draft scene
func close_draft():
	close_by_group("Draft")

## Deallocates the memory used by everything in the specified group
## Groups are set manually on Scene root nodes in the metadata
func close_by_group(group):
	var children = get_children()
	for child in children:
		if child.get_meta("Group", "null") == group:
			child.queue_free()

# Register keyboard input ======================================================

## Used to parse user input
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		go_back()

# Signals from "Title" =========================================================

## Player has pressed the "Start" button on the title screen
func start_game():
	close_title()
	open_draft()

## Player has pressed the "Quit" button on the title screen
func quit_game():
	close_title()
	get_tree().quit()

## Player has pressed the "Settings" button on the title screen
func open_settings():
	print("TODO: Settings menu")

# Signals from "Draft" =========================================================
	
func assign_goblin_to_player(goblin):
	var curr_player_id = "Player1" # HARDCODED FOR NOW BC SINGLEPLAYER DEMO THANGS :P
	PLAYER_MANAGER.add_goblin_to_player(curr_player_id, goblin)

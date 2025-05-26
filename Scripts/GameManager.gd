## Governs a self-contained Game that gets played

## NOTE: A "Game" here refers to a parallel-processed (todo) instance of a game that 
## players are connected to. The actual start of a game (i.e. when shopping and betting and fighting happens)
## is a loop (handles by the Game script) that GameManager governs. Code-wise, Games are implicitly split into
## two sections: setup (players filled, goblins drafted, Arena chosen, etc) and playtime (everything else)

## NOTE: For the most part, once we are here, this file remains the main governing body of Goblin pitfight
## Notable exceptions: 
## 1) when the screen changes (we emit signals specifying which screen is to be loaded and GPManager handles that)
## 2) Referencing global settings or data

extends Node

var GAME = preload("res://Scripts/Entities/Game/Game.gd").new()
@onready var DRAFT_SCENE = preload("res://Scenes/Screens/Draft.tscn")

signal scene_change

## Called by GPManager when a game is started.
func start(num_players):
	create_game()
	fill_players()
	choose_arena()
	open_draft()

## Closes all children. Called by GPManager when user goes back (presses ESC) on draft
func close():
	for child in get_children():
		child.queue_free()

func create_game():
	pass

## Called when game first starts
## Fills all players
## TODO: Hook up to multiplayer game matching
func fill_players():
	pass

## Called when game first starts
## Chooses arena
func choose_arena():
	pass

## Opens the Draft scene, letting players draft
func open_draft():
	var Draft = DRAFT_SCENE.instantiate()
	add_child(Draft)
	
	scene_change.emit("Draft")

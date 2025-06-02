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

signal game_created

var PLAYER_MANAGER
var ARENA_MANAGER

var GAME

func init():
	pass

## Called by GPManager when a game is started.
func create_game(num_players):
	fill_players(num_players)
	choose_arena()
	#OS.delay_msec(1000) # This pauses everything lol. Simple simulation of finding a match
	game_created.emit()

## Closes all children. Called by GPManager when user goes back (presses ESC) on draft
func close():
	for child in get_children():
		child.queue_free()

## Called when game first starts
## Fills all players
## TODO: Hook up to multiplayer game matching
func fill_players(num_players):
	## TODO: Some sort of loop where we wait to connect with other players attempting to join a game
	## with the same mode. After a timeout or whatever, we can go back by emitting signal game_failed_to_start
	## For now, we hardcode add players
	pass

## Called when game first starts
## Chooses arena
func choose_arena():
	pass

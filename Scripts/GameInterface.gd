## This class serves to connect the game being played to rest of code base
## Rather than connecting Switchboard directly to GameManager,
## I figured it'd be better to have an intermediary?? Class may be deleted pending
## whether it ends up being useful/needed or not, but I figured taking 
## "external communication logistics" and putting it here so that
## GameManager can focus SOLELY on managing the game would be better
extends Node

signal game_created
signal creating_game

var SWITCHBOARD
var GAME_MANAGER

## Manually called by Master after first created
## Provides InputController reference
# Initialized GAME_MANAGER
func init(Switchboard):
	SWITCHBOARD = Switchboard
	
	GAME_MANAGER = preload("res://Scripts/Entities/Game/GameManager.gd").new()
	GAME_MANAGER.init()
	GAME_MANAGER.game_created.connect(game_created.emit) # propogate signal backwards

## Triggers GameManager to create a game
func create_game(num_players):
	creating_game.emit()
	GAME_MANAGER.create_game(num_players)

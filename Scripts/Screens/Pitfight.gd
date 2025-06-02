extends Node

signal advance_screen
signal close_game

var NAME = "Pitfight"

## Every screen has this. Some are custom.
func close():
	close_game.emit()

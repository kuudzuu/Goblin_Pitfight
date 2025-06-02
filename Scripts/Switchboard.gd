## Connects signals, bridges the gap between major scenes/scripts
## Basically central hub for program-wide communication
extends Node

var SCREEN_MANAGER
var GAME_INTERFACE

## Called manually by Master on game opening
## Provides references to ScreenManager and GameInterface
func init(ScreenManager, GameInterface):
	SCREEN_MANAGER = ScreenManager
	GAME_INTERFACE = GameInterface

## Handles user keyboard input
func handle_keyboard_event(event):
	if event.is_action_pressed("ui_cancel"):
		SCREEN_MANAGER.reverse_screen()

## Takes the given screen ref, and connects signals to where they need to be connected to
## Idfk how else this would be done? Seems like it needs to be hardcoded SOMEHWERE
func connect_screen_signals(screen):
	match screen.NAME:
		"Title":
			screen.advance_screen.connect(SCREEN_MANAGER.advance_screen)
		"Mode":
			screen.advance_screen.connect(SCREEN_MANAGER.advance_screen)
			screen.players_chosen.connect(GAME_INTERFACE.create_game)
		"Matching":
			pass
		"Pitfight":
			pass

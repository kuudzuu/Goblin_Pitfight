## Purely a class to register user input and send it where it needs to go
## Only communication from user to other things, never in reverse
## Has ScreenManager scene as a direct child
## We shall see if this class is necessary, but I certainly didn't want
## ScreenManager to be in charge of user input, so this scene handles it instead
extends Node

var SWITCHBOARD
var SCREEN_MANAGER

func init(Switchboard, ScreenManager):
	SWITCHBOARD = Switchboard
	SCREEN_MANAGER = ScreenManager
	
	add_child(SCREEN_MANAGER)

## Signals Switchboard to connect user input
func _input(event):
	SWITCHBOARD.handle_keyboard_event(event)

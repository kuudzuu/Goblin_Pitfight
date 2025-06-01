extends Node

var NAME = "Mode"

signal advance_screen
signal players_chosen

func _on_2p_button_pressed() -> void:
	advance_screen.emit()
	players_chosen.emit(2)


func _on_3p_button_pressed() -> void:
	advance_screen.emit()
	players_chosen.emit(3)


func _on_4p_button_pressed() -> void:
	advance_screen.emit()
	players_chosen.emit(4)

## Every screen has this. Some are custom.
func close():
	pass

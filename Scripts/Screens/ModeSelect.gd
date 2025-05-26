extends Node

signal players_chosen

func _on_2p_button_pressed() -> void:
	players_chosen.emit(2)


func _on_3p_button_pressed() -> void:
	players_chosen.emit(3)


func _on_4p_button_pressed() -> void:
	players_chosen.emit(4)

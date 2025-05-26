extends Node

signal start_game
signal quit_game
signal open_settings

func _on_start_button_pressed() -> void:
	emit_signal("start_game")


func _on_quit_button_pressed() -> void:
	emit_signal("quit_game")


func _on_settings_button_pressed() -> void:
	emit_signal("open_settings")

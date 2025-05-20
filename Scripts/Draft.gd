extends Node

var GM = preload("res://Entities/Goblins/GoblinManager.gd").new()

func _ready():
	GM.init()

func _on_goblin_1_selected() -> void:
	var goblin = GM.get_goblin_by_id("Goblin1")
	print("u chose goblin 1 lol")


func _on_goblin_2_selected() -> void:
	var goblin = GM.get_goblin_by_id("Goblin2")
	print("goblin tuah")


func _on_goblin_3_selected() -> void:
	var goblin = GM.get_goblin_by_id("Goblin3")
	print("Goblin 3 likes you too")

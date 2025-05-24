extends Node

var PLAYER_MANAGER = preload("res://Entities/Players/PlayerManager.gd").new()

@onready var TITLE_SCENE = preload("res://Scenes/Title.tscn")
@onready var DRAFT_SCENE = preload("res://Scenes/Draft.tscn")

func _ready():
	PLAYER_MANAGER.create_player("Player1")  # hardcoded for now bc singleplayer demo thangs :P
	open_title()

# ------------------------------------------------------------------

func open_title():
	var Title = TITLE_SCENE.instantiate()
	add_child(Title)
	Title.start_game.connect(start_game)

func close_title():
	close_by_group("Title")

func open_draft():
	var Draft = DRAFT_SCENE.instantiate()
	add_child(Draft)
	Draft.goblin_picked.connect(assign_goblin_to_player)

func close_draft():
	close_by_group("Draft")

func close_by_group(group):
	var children = get_children()
	for child in children:
		if child.get_meta("Group", "null") == group:
			child.queue_free()

# ------------------------------------------------------------------

func start_game():
	close_title()
	open_draft()

func assign_goblin_to_player(goblin):
	var curr_player_id = "Player1" # HARDCODED FOR NOW BC SINGLEPLAYER DEMO THANGS :P
	PLAYER_MANAGER.add_goblin_to_player(curr_player_id, goblin)

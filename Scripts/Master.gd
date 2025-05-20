extends Node

@onready var STAGE_MANAGER = preload("res://Entities/Stages/StageManager.gd")
@onready var TITLE_SCENE = preload("res://Scenes/Title.tscn")
@onready var DRAFT_SCENE = preload("res://Scenes/Draft.tscn")

func _ready():
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

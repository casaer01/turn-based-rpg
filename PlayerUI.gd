extends VBoxContainer

@export var buttons : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/BattleScene").character_begin_turn.connect(_on_character_begin_turn)
	get_node("/root/BattleScene").character_end_turn.connect(_on_character_end_turn)

func _on_character_begin_turn(character):
	visible = character.is_player
	
func _on_character_end_turn(character):
	visible = false

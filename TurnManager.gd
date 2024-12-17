extends Node

@export var player_char : Node
@export var enemy_char : Node
var cur_char : Character

@export var next_turn_delay : float = 1.0

var game_over : bool = false

signal character_begin_turn(character)
signal character_end_turn(character)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	
	begin_next_turn()

func begin_next_turn():
	if cur_char == player_char:
		cur_char = enemy_char
	elif cur_char == enemy_char:
		cur_char = player_char
	else:
		cur_char = player_char
		
#	emits a signal to start when it is a player turn or an enemy turn
	emit_signal("character_begin_turn", cur_char)
	
func end_current_turn():
	
#	emits a signal to end turn when it is a player or enemy turn
	emit_signal("character_end_turn", cur_char)
	
	await get_tree().create_timer(next_turn_delay).timeout
	
	if game_over == false:
		begin_next_turn()
	
func character_died(character):
	game_over = true
	
	if character.is_player == true:
		print("Game Over")
	else:
		print("Winner!")
extends Node2D
class_name Character

@export var is_player : bool
@export var cur_hp : int = 25
@export var max_hp : int = 25

@export var combat_action : Array
@export var oppenent : Node

@onready var health_bar : ProgressBar = get_node("HealthBar")
@onready var health_text : Label = get_node("HealthBar/HealthText")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.max_value = max_hp

func _take_damage(damage):
	cur_hp -= damage
	_update_Health_bar()
	
	if cur_hp <= 0:
		queue_free()
		
func heal(amount):
	
	cur_hp += amount
	if cur_hp > max_hp:
		cur_hp = max_hp
	_update_Health_bar()

func _update_Health_bar():
	health_bar.value = cur_hp
	health_text.text = str(cur_hp, "/", max_hp)

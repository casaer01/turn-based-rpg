extends Button

var CombatButton : CombatAction

func _on_pressed() -> void:
	get_node("/root/BattleScene").cur_character.cast_combat_action(CombatAction)

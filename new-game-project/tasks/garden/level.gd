extends Button

func _on_pressed() -> void:
	get_tree().call_group("lettuce", "inc_level")

extends Node2D
@export var parent : Node

func _on_task_button_pressed() -> void:
	if parent.currChar in parent.in_range:
		get_node("../tasks/star_task").show()
		print(get_node("../tasks/star_task")," shown")

extends "res://tasks/base_task.gd"
@export var task : Node

func _on_task_button_pressed() -> void:
	if currChar in in_range:
		task.show()
		print(task," shown")

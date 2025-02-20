extends Node
@export var parent : Node

func _on_task_button_pressed() -> void:
	if parent.currChar in parent.in_range:
		get_node("../tasks/microwave").show()
		print(get_node("../tasks/microwave")," shown")

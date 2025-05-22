extends char

func _physics_process(delta: float) -> void:
	super(delta)

func _on_task_ui_stickman_time() -> void:
	isCurrChar = true
	get_node("Camera2D").make_current()


func _on_murder_rock_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_murder_rock_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

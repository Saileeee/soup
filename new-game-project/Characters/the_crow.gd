extends char

#@export var SPEED: int
#var started = false
#var paused = false
#var speaking = false
#var entered_room = false
#var in_task = false
#var room_move = 0
#var isCurrChar = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$"the crow".position = Vector2(-760,-1089)
	get_node("Camera2D").make_current()
	isCurrChar = true
	
func _on_task_ui_crowman_time() -> void:
	isCurrChar = true
	get_node("Camera2D").make_current()


func _on_murder_rock_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_murder_rock_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

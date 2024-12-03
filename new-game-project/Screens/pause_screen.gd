extends Control
var between_rooms = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void: #can still move when paused
	if not between_rooms and Input.is_action_just_pressed("pause"):
		if visible:
			hide()
		else:
			show()
			#$paused_camera.make_current()



func _on_room_1_area_body_entered(body: Node2D) -> void:
	between_rooms = true


func _on_room_2_area_body_entered(body: Node2D) -> void:
	between_rooms = true


func _on_room_move_timer_timeout() -> void:
	between_rooms = false

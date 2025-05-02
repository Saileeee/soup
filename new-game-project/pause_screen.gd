extends Control
var between_rooms = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void: 
	if not between_rooms and Input.is_action_just_pressed("pause"):
		if visible:
			hide()
		else:
			show()

'
func _on_room_1_area_body_entered(_body: Node2D) -> void:
	between_rooms = true


func _on_room_2_area_body_entered(_body: Node2D) -> void:
	between_rooms = true


func _on_room_move_timer_timeout() -> void:
	between_rooms = false
'

func _on_button_pressed() -> void:
	hide()
 
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("---------------------------------------------")
	print("pause", at_position, data)
	print("---------------------------------------------")

extends Camera2D
var current_room = "room1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#these values are based off the room size, should make them clearer
	limit_left = 0
	limit_top = -84
	limit_bottom = 640
	limit_right = 1152


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pause_screen_hidden() -> void:
	make_current()


func _on_door_collision_body_entered(body: Node2D) -> void:
	current_room = "room2"
	limit_left = 1186
	limit_right = 2338

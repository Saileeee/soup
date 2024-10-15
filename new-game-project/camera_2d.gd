extends Camera2D
var current_room = "room1"
var dimensions1 = [0, 1152, -84, 640]
var dimensions2 = [1186, 2338, -84, 640]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#these values are based off the room size, should make them clearer
	limit_left = dimensions1[0]
	limit_right = dimensions1[1]
	limit_top = dimensions1[2]
	limit_bottom = dimensions1[3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pause_screen_hidden() -> void:
	make_current()


func _on_door_collision_body_entered(body: Node2D) -> void:
	if current_room == "room1":
		current_room = "room2"
		limit_left = dimensions2[0]
		limit_right = dimensions2[1]
		limit_top = dimensions2[2]
		limit_bottom = dimensions2[3]
	elif current_room == "room2":
		current_room = "room1"
		limit_left = dimensions1[0]
		limit_right = dimensions1[1]
		limit_top = dimensions1[2]
		limit_bottom = dimensions1[3]
		#brieeeeeee

func _on_welcome_hidden() -> void:
	make_current()

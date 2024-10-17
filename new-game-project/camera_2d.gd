extends Camera2D
var current_room
var dimensions1 = [0, 1152, -84, 640]
var dimensions2 = [1152, 2304, -84, 640]
var count

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	count = 0
	#these values are based off the room size, should make them clearer
	current_room = "room1"
	limit_left = dimensions1[0]
	limit_right = dimensions1[1]
	limit_top = dimensions1[2]
	limit_bottom = dimensions1[3]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count += 1
	if count == 100:
		print(get_screen_center_position())
		count = 0


func _on_pause_screen_hidden() -> void:
	make_current()


func _on_welcome_hidden() -> void:
	make_current()


func _on_room_1_area_body_entered(body: Node2D) -> void:
	print("room1 entered")
	current_room = "room1"
	limit_left = dimensions1[0]
	limit_right = dimensions1[1]
	limit_top = dimensions1[2]
	limit_bottom = dimensions1[3]


func _on_room_2_area_body_entered(body: Node2D) -> void:
	print("room2 entered")
	current_room = "room2"
	limit_left = dimensions2[0]
	limit_right = dimensions2[1]
	limit_top = dimensions2[2]
	limit_bottom = dimensions2[3]

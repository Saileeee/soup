extends Camera2D
#var current_room
#var count


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#count = 0
	#these values are based off the room size, should make them clearer
	#current_room = "room1"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#count += 1
	#if count == 100:
	#	print(get_screen_center_position())
	#	count = 0
	pass





func _on_hub_area_entered(area: Area2D) -> void:
	limit_left = -1900
	limit_right = -245
	limit_top = -1583
	limit_bottom = -1776



func _on_hallway_area_entered(area: Area2D) -> void:
	limit_left = -2932
	limit_right = -1845
	limit_top = -560
	limit_bottom = 80



func _on_clinic_area_entered(area: Area2D) -> void:
	limit_left = -2932
	limit_right = -1845
	limit_top = 143
	limit_bottom = 975


func _on_idk_room_area_entered(area: Area2D) -> void:
	limit_left = -2932
	limit_right = -1845
	limit_top = -1520
	limit_bottom = 143


func _on_welcome_hidden() -> void:
	make_current()
	limit_left = -1900
	limit_right = -245
	limit_top = -1583
	limit_bottom = -176

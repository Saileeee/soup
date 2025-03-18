extends Control

var num_in_place = 0
var count = 0

func _ready() -> void:
	$AnimatedSprite2D.play()

func _process(delta: float) -> void:
	$TextureRect.texture = $AnimatedSprite2D.get_sprite_frames().get_frame_texture("default", $AnimatedSprite2D.frame) #set texture to current frame of animation
	#count += 1
	#if count > 100:
		#count = 0
		#print(num_in_place)
	if num_in_place == 10:
		$"full image".show()
		get_tree().call_group("pieces", "hide")

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	#if data.is_in_position:
		#return false
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.position = at_position + Vector2(-data.texture.region.size/2)

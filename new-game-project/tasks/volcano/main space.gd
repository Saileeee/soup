extends Control

var num_in_place = 0
var count = 0
var timer_started = false
#var move: Timer

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
		if not timer_started:
			$timer.start()
			timer_started = true
		elif not $timer.is_stopped():
			$"full image".position.x += 20-$timer.time_left*6
			$beaker.position.x -= 20-$timer.time_left*6
			if $beaker.position.x<700:
				$beaker.position.x = 700

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	#if data.is_in_position:
		#return false
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is TextureRect:
		data.position = at_position + Vector2(-data.texture.region.size/2)
	if data is Array:
		data[0].position = at_position + Vector2(data[1])
		if data[1].position<Vector2(750, 250) and data[1].position> :
			pass


func _on_timer_timeout() -> void:
	$temp.show()


func _on_temp_pressed() -> void:
	$"full image".position = Vector2(-2, 97)
	$temp.hide()

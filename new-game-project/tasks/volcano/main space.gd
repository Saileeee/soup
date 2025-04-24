extends Control

var num_in_place = 0
var count = 0
var timer_started = false
var in_beaker = false
var in_pour_area = false
var clicked = false #in third stage or whatever, basically can pour
#var move: Timer

func _ready() -> void:
	#$AnimatedSprite2D.play()
	pass

func _process(_delta: float) -> void:
	#if clicked:
		#$Label.show()
	#else:
		#$Label.hide()
	#if Input.is_action_pressed("click"):
		#$Label2.show()
	#else:
		#$Label2.hide()
	#if in_beaker:
		#$Label3.show()
	#else:
		#$Label3.hide()
	#if in_pour_area:
		#$Label4.show()
	#else:
		#$Label4.hide()
	#$TextureRect.texture = $AnimatedSprite2D.get_sprite_frames().get_frame_texture("default", $AnimatedSprite2D.frame) #set texture to current frame of animation
	#count += 1
	#if count > 100:
		#count = 0
		#print(clicked, Input.is_action_pressed("click"), in_beaker, in_pour_area)
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
	var mouse_position = get_viewport().get_mouse_position()
	if mouse_position<Vector2(750, 370) and mouse_position>Vector2(620, 0):
		in_pour_area = true
	else:
		in_pour_area = false
	var preview = Control.new()
	var image = TextureRect.new()
	preview.add_child(image)
	image.texture = $beaker/image.get_sprite_frames().get_frame_texture("default", $beaker/image.frame)
	var pos = Vector2(-image.texture.region.size/2)
	image.position = pos
	if clicked and Input.is_action_pressed("click"):
		var dist = abs(670-mouse_position.x)
		if dist>200 or mouse_position.y>250:
			image.rotation = 0
			#$beaker/particles.position = Vector2(28, 73)
		else:
			image.rotation = -PI/2+dist*PI/400
			#$particles.position = (mouse_position-Vector2(67, 86)).rotated(image.rotation)
			#$rect.position = $particles.position
		#$Label5.text = "rotation: "+str(image.rotation*180/PI)
		#$Label6.text = "distance: "+str(dist)+" mouse position: "+str(mouse_position.x)
		
		#if in_beaker:
			#$beaker.hide()
		$beaker.set_drag_preview(preview)
		if in_beaker and in_pour_area:
			$particles.emitting = true
			$particles.position = mouse_position - Vector2(90, 70)
		else:
			$particles.emitting = false

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	#if data.is_in_position:
		#return false
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is TextureRect:
		data.position = at_position + Vector2(-data.texture.region.size/2)
	if data is Array:
		data[0].position = at_position + Vector2(data[1])
		
func _on_timer_timeout() -> void:
	$temp.show()


func _on_temp_pressed() -> void:
	$"full image".position = Vector2(-2, 97)
	$temp.hide()
	clicked = true

#some inane definitly not the most logical code
func _on_beaker_mouse_entered() -> void:
	in_beaker = true

func _on_beaker_mouse_exited() -> void:
	if Input.is_action_pressed("click") and in_beaker:
		pass
	else:
		in_beaker = false

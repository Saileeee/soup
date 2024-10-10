extends CharacterBody2D

var start = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if start:
		var x_direction = Input.get_axis("move_left", "move_right")
		velocity.x = x_direction
		var y_direction = Input.get_axis("move_up", "move_down") #up is negative and down is positive
		velocity.y = y_direction
		
		if velocity.length() > 0:
			velocity = velocity.normalized() * SPEED
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
		
		move_and_slide()


func _on_pause_screen_hidden() -> void:
	$main_camera.make_current()


func _on_welcome_hidden() -> void:
	start = true

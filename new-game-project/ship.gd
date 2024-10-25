extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = 0


func _physics_process(delta: float) -> void:
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

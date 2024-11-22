extends CharacterBody2D

var start = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var room_move = 0
var entered_room = false

func _physics_process(_delta: float) -> void:
	##if start:
		var x_direction = Input.get_axis("move_left", "move_right")
		velocity.x = x_direction
		var y_direction = Input.get_axis("move_up", "move_down") #up is negative and down is positive
		velocity.y = y_direction
		
		if velocity.length() > 0:
			velocity = velocity.normalized() * SPEED
			$AnimatedSprite2D.play()
		elif room_move==0:
			$AnimatedSprite2D.stop()
		if entered_room:
			$"room move timer".start()
			entered_room = false
		if room_move != 0:
			velocity.x = room_move
			$AnimatedSprite2D.play()
		
		move_and_slide()


func _on_pause_screen_hidden() -> void:
	$main_camera.make_current()


func _on_welcome_hidden() -> void:
	start = true
	room_move = 0


func _on_room_1_area_body_entered(_body: Node2D) -> void:
	room_move = -500
	entered_room = true


func _on_room_2_area_body_entered(_body: Node2D) -> void:
	room_move = 500
	entered_room = true


func _on_room_move_timer_timeout() -> void:
	room_move = 0

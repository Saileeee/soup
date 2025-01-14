extends CharacterBody2D


var speed = 300.0
const JUMP_VELOCITY = -400.0
var isCurrChar = false

func _ready():
	$ColorRect2.hide()

func _physics_process(delta: float) -> void:
	if isCurrChar:
		var x_direction = Input.get_axis("move_left", "move_right")
		velocity.x = x_direction
		var y_direction = Input.get_axis("move_up", "move_down") #up is negative and down is positive
		velocity.y = y_direction
		velocity = velocity * speed
		if Input.is_action_just_pressed("interact"):
			print("v")
			$CollisionShape2D.disabled = not $CollisionShape2D.disabled
			$ColorRect2.visible = not $ColorRect2.visible
	move_and_slide()


func _on_h_slider_value_changed(value: float) -> void:
	speed = value

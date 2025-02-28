extends ColorRect
@export var collision: Node

func _ready() -> void:
	collision.disabled = true
	visible = false

func _process(_delta) -> void:
	if Input.is_action_just_pressed("interact"):
			print("v")
			collision.disabled = not collision.disabled
			visible = not visible

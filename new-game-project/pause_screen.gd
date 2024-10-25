extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void: #can still move when paused
	if Input.is_action_just_pressed("pause"):
		if visible:
			hide()
		else:
			show()
			$paused_camera.make_current()

extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wait_time = 2
	autostart = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

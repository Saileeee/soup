extends Camera2D
var paused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_current()
	paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pause_screen_visibility_changed() -> void:
	paused = not paused
	if paused:
		make_current()

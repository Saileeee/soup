extends Timer

var a = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wait_time = 5
	autostart = true# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = a



func _on_timeout() -> void:
	a += 1
	 

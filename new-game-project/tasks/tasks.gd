extends CanvasLayer #-414
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		child.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count += 1
	if count >= 100:
		count = 0
		print("star task visible: ",$"star task".visible)

func _on_star_close_pressed() -> void:
	$"star task".hide()

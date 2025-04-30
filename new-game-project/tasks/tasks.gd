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
		print("microwave visible: ", $"microwave".visible)

func _on_star_close_pressed() -> void:
	$"star task".hide()

func _on_micro_close_pressed() -> void:
	$microwave.hide()

func _on_volcano_close_pressed() -> void:
	$Volcano.hide()

func _on_star_task_pressed() -> void:
	$"star task".show()

func _on_microwave_task_pressed() -> void:
	$microwave.show()

func _on_volcano_task_pressed() -> void:
	$"Volcano".show()

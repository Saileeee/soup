extends Label
var timer
var time: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if index == 10: #stop
		pass
	elif time.length()>4: #max char limit
		return
	elif index <= 8: #1-9
		time += str(index+1)
	elif index == 10: #0
		time += str(0)
	elif index == 11: #start
		timer = timer.new()
		
	else:
		text = time.insert(2,":")

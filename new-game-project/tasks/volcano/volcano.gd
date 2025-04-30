extends Control
var started = false

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _process(delta: float) -> void:
	if not started:
		for node in get_tree().get_nodes_in_group("pieces"):
			if node.is_dragging:
				started = true
				$"puzzle timer".start()
	else:
		$time.text = (str)(round(($"puzzle timer".time_left-.2)*10)/10)
		if $time.text.contains("-"):
			$time.text = "0.0"

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data is TextureRect:
		data.position = at_position + Vector2(-data.texture.region.size/2)
	if data is Array:
		data[0].position = at_position + Vector2(data[1])


func _on_puzzle_timer_timeout() -> void:
	get_tree().call_group("pieces", "explode")

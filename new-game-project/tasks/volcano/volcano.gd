extends Control #issues with drop data I think 
var started = false
var num_in_place = 0

func _can_drop_data(_at_position: Vector2, _data: Variant) -> bool:
	return true

func _process(_delta: float) -> void:
	if num_in_place == 10:
		$"puzzle timer".stop()
		$background.color = Color.DARK_GREEN
	if not started:
		for node in get_tree().get_nodes_in_group("pieces"):
			if node.is_dragging:
				started = true
				$"puzzle timer".start()
	else:
		var time = round(($"puzzle timer".time_left-.5)*10)/10
		$time.text = (str)(time)
		if time<0:
			$time.text = "0.0"
		if time < 5:
			$background.color[0] += time*.0005
			print($background.color, str(time))
	if started and $"puzzle timer".paused:
		for node in get_tree().get_nodes_in_group("pieces"):
			if node.is_dragging:
				$"puzzle timer".paused = false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("---------------------------------------------")
	print("volcano", at_position, data)
	print("---------------------------------------------")
	if data is TextureRect:
		data.position = at_position + Vector2(-data.texture.region.size/2)
		print(str(data.position))
	if data is Array:
		data[0].position = at_position + Vector2(data[1])


func _on_puzzle_timer_timeout() -> void:
	get_tree().call_group("pieces", "explode")
	$background.color = Color.DARK_RED


func _on_volcano_close_pressed() -> void:
	$"puzzle timer".paused = true

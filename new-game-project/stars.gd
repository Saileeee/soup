extends TextureButton
var in_range = []
var char_RIDs = [] #crowman, stickman, fly
var currRID

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	char_RIDs.append(get_node("/Node2D/characters/crowman").get_id())
	char_RIDs.append(get_node("/Node2D/characters/stickman").get_id())
	char_RIDs.append(get_node("/Node2D/characters/fly").get_id())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if currRID in in_range:
		show()
	else:
		hide()



func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	for rid in char_RIDs:
		if rid == body_rid:
			in_range.append(body_rid)


func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	for i in range(char_RIDs.size()): #goes backwards because removing from the array
		if char_RIDs[i] == body_rid:
			in_range.erase(body_rid)


func _on_task_ui_crowman_time() -> void:
	currRID = char_RIDs[0]

func _on_task_ui_stickman_time() -> void:
	currRID = char_RIDs[1]

func _on_task_ui_fly_time() -> void:
	currRID = char_RIDs[2]


func _on_pressed() -> void:
	if currRID in in_range:
		get_node("tasks/star task").show()

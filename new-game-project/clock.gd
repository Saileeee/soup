extends Node2D
var min = 40
var hour = 20
var tra = 0;
signal end;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "20:40"# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_real_clock_timeout() -> void:
	min+=10
	if min==60:
		min=0
		hour+=1
	else:
		$Label.text = str(hour)+":"+str(min)
	if hour==21:
		tra+=0.1
		get_node("%Night").set_color(Color(0,0,0,(tra)))
		print (tra)
	elif hour==22:
		hour=0;
		min=0;
		$Label.text = str(hour)+":0"+str(min)
		get_node("%Night").set_color(Color(0,0,0,255))
		end.emit()

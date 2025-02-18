extends Node2D
var min = 00
var hour = 6
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
		$Label.text = str(hour)+":0"+str(min)
	else:
		$Label.text = str(hour)+":"+str(min)
	if hour==21:
		tra+=0.1
		get_node("%Night").set_color(Color(0,0,0,(tra)))
		print (tra)
	elif hour==22:
		hour=0;
		min=0;
		get_node("%Night").set_color(Color(0,0,0,255))
		end.emit()

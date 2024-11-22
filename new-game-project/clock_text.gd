extends Label

var a = 0
var c = 20
var night = ColorRect.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "6:00"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	a+=10
	if a==60:
		a=0
		c+=1
		if c==21:
			var col = Color(0,0,0,1)
			night.color=col
			
		if c==22:
			c=0;
			a=0;
			text = str(c)+":0"+str(a)
			$Timer.stop()
		text = str(c)+":0"+str(a)
	else:
		text = str(c)+":"+str(a)

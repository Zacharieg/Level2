extends AudioStreamPlayer

export (bool) var loop_sound = true
func _ready():
	connect("finished", self, "_on_finished")
	
func _on_finished():
	if loop_sound == true:
		play();

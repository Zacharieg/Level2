extends WoodBox

export var force = 700

func _on_Area2D_body_entered(body):
	var contacts = $Area2D.get_overlapping_bodies()
	for c in contacts:
		var p : = c as Player
		if p :
			p.motion.y = -700

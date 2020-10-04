extends Node2D
class_name PowerUp

export var type : String
export var message : String

var used = false

func repair():
	show()
	used = false

func destroy():
	hide()
	used = true

func _on_Area2D_body_entered(body):
	if not used:
		var contacts = $Area2D.get_overlapping_bodies()
		for c in contacts:
			var p : = c as Player
			if p :
				p.power_up(type)
				p.power_up_anim(message)
				destroy()

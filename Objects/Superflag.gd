extends Node2D
class_name SuperFlag

signal finish(text)

export var finish_text = "Go to level 2"

func _on_Area2D_body_entered(body):
	var contacts = $Area2D.get_overlapping_bodies()
	for c in contacts:
		var p : = c as Player
		if p :
			emit_signal("finish", finish_text)

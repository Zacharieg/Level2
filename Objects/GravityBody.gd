class_name GravityBody
extends KinematicBody2D

const UP = Vector2(0, -1)

export var WEIGTH = 20

var motion = Vector2()

func _physics_process(delta):
	motion.y += WEIGTH
	motion = move_and_slide(motion, UP)

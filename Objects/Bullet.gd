extends KinematicBody2D
class_name Bullet

export var BULLET_SPEED = 50
var vers_droite : bool

func init(droite):
	vers_droite = droite

func _physics_process(delta):
	var move = BULLET_SPEED
	if not vers_droite:
		move = -BULLET_SPEED
	var collision = move_and_collide(Vector2(move, 0))
	if collision != null:
		var p : = collision.collider as Player
		var wb : = collision.collider as WoodBox
		var f : = collision.collider.get_owner() as Flag
		var mb : = collision.collider as MetalBox
		if wb : wb.destroy()
		if f : f.destroy()
		if p : p.kill()
		if mb : vers_droite = not vers_droite
		else : queue_free()

extends GravityBody
class_name MetalBox

func push(x : float) :
	move_and_slide(Vector2(x, 0))
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var box : = collision.collider as MetalBox
		if box : box.push(x)

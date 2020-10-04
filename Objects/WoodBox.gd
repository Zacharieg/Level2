extends GravityBody
class_name WoodBox

func push(x : float) :
	move_and_slide(Vector2(x, 0), UP)

func destroy():
	queue_free()

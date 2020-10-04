extends GravityBody
class_name Paroie

func push(x : float) :
	move_and_slide(Vector2(x, 0), UP)

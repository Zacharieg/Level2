extends GravityBody
class_name Player

export var SPEED = 200
export var JUMP_FORCE = 500
export var power : String
export var CLIMB_SPEED = 200

var vers_droite = true

signal restart

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Character/AnimatedSprite.flip_h = false
		vers_droite = true
	elif Input.is_action_pressed("ui_left"):
		motion.x = - SPEED
		$Character/AnimatedSprite.flip_h = true
		vers_droite = false
	else :
		motion.x = 0
		$Character/AnimatedSprite.play("Stay")
	
	if motion.x != 0:
		$Character/AnimatedSprite.play("Walk")
	
	if power == "" or power == "big":
		if is_on_floor():
			if Input.is_action_just_pressed("ui_action"):
				motion.y -= JUMP_FORCE
				$JumpSound.play()
		else :
			$Character/AnimatedSprite.play("Jump")
	
	var climb = false
	
	if power == "climb" :
		if is_on_wall():
			if Input.is_action_pressed("ui_action"):
				motion.y =  - CLIMB_SPEED
				climb = true
			else :
				motion.y = 0
	
	if power == "gun" :
		if Input.is_action_just_pressed("ui_action"):
			$LaserSound.play()
			var bullet = load("res://Objects/Bullet.tscn").instance()
			get_owner().add_child(bullet)
			if vers_droite:
				bullet.global_position = $CanonD.global_position
			else: 
				bullet.global_position = $CanonG.global_position
			bullet.init(vers_droite)
	
	motion.y = move_and_slide(motion, UP).y
	if get_slide_count() > 0 and not climb:
		check_collision(motion)

func check_collision(motion : Vector2):
	var contacts = $Character/Arms.get_overlapping_bodies()
	var adding = 1
	if vers_droite :
		adding = -1
	
	for i in range(contacts.size()):
		var wbox : = contacts[i] as WoodBox
		var mbox : = contacts[i] as MetalBox
		var paroie : = contacts[i] as Paroie
		if wbox : wbox.push(motion.x + adding)
		elif paroie : paroie.push(motion.x + adding)
		elif mbox and power == "big" :
			mbox.push(motion.x + adding)

func power_up(p : String):
	power = p
	if p == "big":
		$PowerUP.play("Big")	
	else :
		$PowerUP.play("Normal")

func power_up_anim(message : String) :
	$PowerUpSound.play()
	$UIAnimation.play("PowerUp")
	$NewPowerUp/MessagePowerUp.set_text(message)

func kill():
	$DieSound.play()
	$UIAnimation.play("Death")
	yield(get_tree().create_timer(1.5), "timeout")
	emit_signal("restart")
	

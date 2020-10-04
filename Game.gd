extends Node2D

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$Player/UIAnimation.play("Level")

func finish(text = "Well done ! Let's try level 2") :
	get_tree().paused = true
	$CanvasLayer/Finish.show()
	$CanvasLayer/Finish/Label.text = text

func start() :
	get_tree().paused = false
	$CanvasLayer/Finish.hide()
	$Player.global_position = $Spawn.global_position
	$Player/UIAnimation.play("Level")
	$Player.power_up("")
	for ch in $Objects.get_children():
		var powerUp : = ch as PowerUp
		if powerUp : powerUp.repair()

func _on_Button_pressed():
	start()

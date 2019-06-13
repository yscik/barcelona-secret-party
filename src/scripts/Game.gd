extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	$Beat.wait_time = Global.bpm
	
	$Player.visible = false
	
	get_tree().paused = true
	
	$Beat.start()
	#$Bass.play("Bass1", -1, 4.0 / Global.bpm)
	$Bass/MusicBase.play()
	
	if Global.start:
		start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

#
func _unhandled_key_input(event):
	if event.pressed && event.scancode == KEY_ESCAPE:
		pause()
#
func end():
	$Bass/MusicBase.stop()
	$Busted.visible = true
	$Beat.stop()

func quit():
	get_tree().quit()
	pass # replace with function body

func pause():
	if $Beat.is_stopped():		
		$Beat.start()
		$Paused.visible = false
	else:
		$Paused.visible = true
		$Beat.stop()
	
func restart():
	Global.start = true
	get_tree().reload_current_scene()
	
	pass # replace with function body


func start():
	$Starting.visible = false
	$Player.visible = true
	get_tree().paused = false
	
	

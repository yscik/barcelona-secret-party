extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Beat.wait_time = Global.bpm
	$Beat.start()
	$Bass.play("Bass1", -1, 16.0 / Global.bpm)
	$Bass/MusicBase.play()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
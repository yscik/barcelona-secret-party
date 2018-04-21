extends Timer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	wait_time = Global.bpm
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func beat():
	get_tree().call_group("Beat", "beat")
	pass # replace with function body

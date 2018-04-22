extends "res://scripts/Human.gd"

func _ready():
	pass

var turned = false

func beat():
	var turn = !turned && at_corner() && randf() > 0.5
	turned = false
	
	if turn:
		turn()
		turned = true
	else:
		searchlight()
		move()
		
var light_dir = 0

func searchlight():
	
	light_dir = randi() % 3 - 1 if light_dir == 0 else 0
	
	update_rot(light_dir * 25)

func sees_player():
	Global.player
	pass
	
func toggle_flashlight():
	$Model/Light.light_energy = 16
	